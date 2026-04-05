import 'package:equatable/equatable.dart';

class Attraction extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String location;
  final double estimatedBudgetPerDay;

  final int priceCategory; // 1: Economic, 2: Moderate, 3: Luxury
  final List<String> suitablePurposes; // ['Adventure', 'Family', etc.]

  const Attraction({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.location,
    required this.estimatedBudgetPerDay,
    required this.priceCategory,
    required this.suitablePurposes,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        location,
        estimatedBudgetPerDay,
        priceCategory,
        suitablePurposes,
      ];
}
