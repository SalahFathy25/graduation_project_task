import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/features/auth/domain/entities/app_user.dart';

class UserModel extends AppUser {
  const UserModel({
    required super.id,
    required super.email,
    required super.fullName,
    required super.travelerType,
    required super.travelPurpose,
    required super.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      travelerType: json['travelerType'] as String? ?? 'متوسط',
      travelPurpose: json['travelPurpose'] as String? ?? 'عائلة',
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullName': fullName,
      'travelerType': travelerType,
      'travelPurpose': travelPurpose,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory UserModel.fromEntity(AppUser user) {
    return UserModel(
      id: user.id,
      email: user.email,
      fullName: user.fullName,
      travelerType: user.travelerType,
      travelPurpose: user.travelPurpose,
      createdAt: user.createdAt,
    );
  }
}
