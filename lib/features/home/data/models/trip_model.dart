import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Trip extends Equatable {
  final String id;
  final String userId;
  final String name;
  final String city;
  final String startDate;
  final String endDate;
  final double budget;
  final double spent;
  final String? travelPurpose;
  final String? travelerType;
  final List<Map<String, dynamic>> activities;

  const Trip({
    required this.id,
    required this.userId,
    required this.name,
    required this.city,
    required this.startDate,
    required this.endDate,
    required this.budget,
    this.spent = 0.0,
    this.travelPurpose,
    this.travelerType,
    this.activities = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'city': city,
      'startDate': startDate,
      'endDate': endDate,
      'budget': budget,
      'spent': spent,
      'travelPurpose': travelPurpose,
      'travelerType': travelerType,
      'activities': activities,
    };
  }

  factory Trip.fromMap(Map<String, dynamic> map) {
    return Trip(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      city: map['city'] ?? '',
      startDate: map['startDate'] ?? '',
      endDate: map['endDate'] ?? '',
      budget: (map['budget'] ?? 0.0).toDouble(),
      spent: (map['spent'] ?? 0.0).toDouble(),
      travelPurpose: map['travelPurpose'],
      travelerType: map['travelerType'],
      activities: List<Map<String, dynamic>>.from(map['activities'] ?? []),
    );
  }

  Trip copyWith({
    String? id,
    String? userId,
    String? name,
    String? city,
    String? startDate,
    String? endDate,
    double? budget,
    double? spent,
    String? travelPurpose,
    String? travelerType,
    List<Map<String, dynamic>>? activities,
  }) {
    return Trip(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      city: city ?? this.city,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      budget: budget ?? this.budget,
      spent: spent ?? this.spent,
      travelPurpose: travelPurpose ?? this.travelPurpose,
      travelerType: travelerType ?? this.travelerType,
      activities: activities ?? this.activities,
    );
  }

  @override
  List<Object?> get props => [id, userId, name, city, startDate, endDate, budget, spent, travelPurpose, travelerType, activities];
}
