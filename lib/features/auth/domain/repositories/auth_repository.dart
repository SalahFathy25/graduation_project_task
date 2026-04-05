import 'package:graduation_project/features/auth/domain/entities/app_user.dart';

abstract class AuthRepository {
  Stream<AppUser?> get authStateChanges;
  Future<AppUser?> getCurrentUser();
  Future<AppUser> signIn(String email, String password);
  Future<AppUser> signUp(String fullName, String email, String password, String travelerType, String travelPurpose);
  Future<void> signOut();
  Future<void> resetPassword(String email);
}
