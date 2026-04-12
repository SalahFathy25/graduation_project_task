import 'package:equatable/equatable.dart';
import 'package:graduation_project/features/auth/domain/entities/app_user.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  final AppUser? currentUser;
  const AuthLoading({this.currentUser});

  @override
  List<Object?> get props => [currentUser];
}

class Authenticated extends AuthState {
  final AppUser user;
  const Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthenticatedGuest extends AuthState {}

class Unauthenticated extends AuthState {}

// حالة جديدة لنجاح التسجيل فقط
class AuthRegistrationSuccess extends AuthState {}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthPasswordResetSent extends AuthState {}
