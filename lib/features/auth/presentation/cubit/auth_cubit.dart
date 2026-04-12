import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription? _authSubscription;
  bool _isRegistering = false;

  AuthCubit(this._authRepository) : super(AuthInitial()) {
    _monitorAuthState();
  }

  void _monitorAuthState() {
    _authSubscription?.cancel();
    _authSubscription = _authRepository.authStateChanges.listen((user) {
      // Ignore auth state changes during registration to avoid flickering
      if (_isRegistering) return;

      if (user != null) {
        emit(Authenticated(user));
      } else {
        // إذا كان المستخدم ضيفاً، لا نريد تغيير الحالة هنا لأن Firebase authState لن يعرف عنه
        if (state is! AuthenticatedGuest && state is! AuthRegistrationSuccess) {
          emit(Unauthenticated());
        }
      }
    });
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await _authRepository.signIn(email, password);
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthError(e.toString().replaceAll('Exception: ', '')));
    }
  }

  void loginAsGuest() {
    emit(AuthenticatedGuest());
  }

  Future<void> register(String fullName, String email, String password, String travelerType, String travelPurpose) async {
    _isRegistering = true;
    emit(AuthLoading());
    try {
      await _authRepository.signUp(fullName, email, password, travelerType, travelPurpose);
      // بعد التسجيل الناجح، نقوم بتسجيل الخروج لنقل المستخدم لشاشة الدخول يدوياً
      await _authRepository.signOut();
      _isRegistering = false;
      emit(AuthRegistrationSuccess());
    } catch (e) {
      _isRegistering = false;
      emit(AuthError(e.toString().replaceAll('Exception: ', '')));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await _authRepository.signOut();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString().replaceAll('Exception: ', '')));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    try {
      await _authRepository.resetPassword(email);
      emit(AuthPasswordResetSent());
    } catch (e) {
      emit(AuthError(e.toString().replaceAll('Exception: ', '')));
    }
  }

  Future<void> updateName(String newName) async {
    final currentUser = state is Authenticated ? (state as Authenticated).user : null;
    emit(AuthLoading(currentUser: currentUser));
    try {
      await _authRepository.updateProfile(fullName: newName);
      final user = await _authRepository.getCurrentUser();
      if (user != null) {
        emit(Authenticated(user));
      }
    } catch (e) {
      emit(AuthError(e.toString().replaceAll('Exception: ', '')));
    }
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
