import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String id;
  final String email;
  final String fullName;
  final String travelerType;
  final String travelPurpose;
  final DateTime createdAt;

  const AppUser({
    required this.id,
    required this.email,
    required this.fullName,
    required this.travelerType,
    required this.travelPurpose,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, email, fullName, travelerType, travelPurpose, createdAt];
}
