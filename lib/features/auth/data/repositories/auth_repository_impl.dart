import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:graduation_project/features/auth/data/models/user_model.dart';
import 'package:graduation_project/features/auth/domain/entities/app_user.dart';
import 'package:graduation_project/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final firebase.FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthRepositoryImpl({
    firebase.FirebaseAuth? auth,
    FirebaseFirestore? firestore,
  })  : _auth = auth ?? firebase.FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Stream<AppUser?> get authStateChanges => _auth.authStateChanges().asyncMap((user) async {
        if (user == null) return null;
        try {
          final currentUser = await getCurrentUser();
          if (currentUser != null) return currentUser;
          
          return AppUser(
            id: user.uid,
            email: user.email ?? '',
            fullName: user.displayName ?? 'مسافر',
            travelerType: 'غير محدد',
            travelPurpose: 'عائلة',
            createdAt: DateTime.now(),
          );
        } catch (e) {
          // إذا حدث خطأ في الصلاحيات، نعيد المستخدم الأساسي من Auth على الأقل
          return AppUser(
            id: user.uid,
            email: user.email ?? '',
            fullName: user.displayName ?? 'مسافر',
            travelerType: 'غير محدد',
            travelPurpose: 'عائلة',
            createdAt: DateTime.now(),
          );
        }
      });

  @override
  Future<AppUser?> getCurrentUser() async {
    final user = _auth.currentUser;
    if (user == null) return null;

    try {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists && doc.data() != null) {
        return UserModel.fromJson({...doc.data()!, 'id': user.uid});
      }
    } catch (e) {
      print('Firestore Error: $e');
      rethrow;
    }
    return null;
  }

  @override
  Future<AppUser> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = await getCurrentUser();
      if (user == null) {
         // إذا لم يجد بيانات في Firestore، ننشئ كائن مستخدم مؤقت
         final authUser = _auth.currentUser!;
         return AppUser(
           id: authUser.uid,
           email: authUser.email ?? '',
           fullName: authUser.displayName ?? 'مسافر',
           travelerType: 'غير محدد',
           travelPurpose: 'عائلة',
           createdAt: DateTime.now(),
         );
      }
      return user;
    } on firebase.FirebaseException catch (e) {
      throw _handleFirebaseException(e);
    }
  }

  @override
  Future<AppUser> signUp(String fullName, String email, String password, String travelerType, String travelPurpose) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user?.updateDisplayName(fullName);

      final user = AppUser(
        id: credential.user!.uid,
        email: email,
        fullName: fullName,
        travelerType: travelerType,
        travelPurpose: travelPurpose,
        createdAt: DateTime.now(),
      );

      final userModel = UserModel.fromEntity(user);

      // محاولة الحفظ في Firestore
      try {
        await _firestore.collection('users').doc(user.id).set(userModel.toJson());
      } catch (e) {
        print('Warning: Could not save user to Firestore: $e');
      }

      return user;
    } on firebase.FirebaseException catch (e) {
      throw _handleFirebaseException(e);
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on firebase.FirebaseException catch (e) {
      throw _handleFirebaseException(e);
    }
  }

  Exception _handleFirebaseException(firebase.FirebaseException e) {
    switch (e.code) {
      case 'weak-password': return Exception('كلمة المرور ضعيفة جداً.');
      case 'email-already-in-use': return Exception('هذا البريد مسجل مسبقاً.');
      case 'user-not-found': return Exception('المستخدم غير موجود.');
      case 'wrong-password': return Exception('كلمة المرور خاطئة.');
      case 'permission-denied': return Exception('خطأ في صلاحيات قاعدة البيانات.');
      default: return Exception(e.message ?? 'حدث خطأ غير متوقع.');
    }
  }
}
