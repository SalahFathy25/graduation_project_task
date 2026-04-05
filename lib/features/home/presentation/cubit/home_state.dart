import 'package:equatable/equatable.dart';
import 'package:graduation_project/features/home/data/models/trip_model.dart';
import 'package:graduation_project/features/attractions/domain/entities/attraction.dart';

class HomeState extends Equatable {
  final int currentIndex;
  final List<Trip> trips;
  final List<Attraction> favorites;
  final Trip? selectedTrip;
  final String searchQuery;
  final String? selectedCategory;
  final bool isLoading;
  final String? errorMessage;

  const HomeState({
    this.currentIndex = 0,
    this.trips = const [],
    this.favorites = const [],
    this.selectedTrip,
    this.searchQuery = '',
    this.selectedCategory,
    this.isLoading = false,
    this.errorMessage,
  });

  HomeState copyWith({
    int? currentIndex,
    List<Trip>? trips,
    List<Attraction>? favorites,
    Trip? selectedTrip,
    String? searchQuery,
    String? Function()? selectedCategory,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      currentIndex: currentIndex ?? this.currentIndex,
      trips: trips ?? this.trips,
      favorites: favorites ?? this.favorites,
      selectedTrip: selectedTrip ?? this.selectedTrip,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCategory: selectedCategory != null ? selectedCategory() : this.selectedCategory,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        currentIndex,
        trips,
        favorites,
        selectedTrip,
        searchQuery,
        selectedCategory,
        isLoading,
        errorMessage,
      ];
}
