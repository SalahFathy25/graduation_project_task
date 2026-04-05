import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/attractions/domain/entities/attraction.dart';
import 'package:graduation_project/features/home/data/models/trip_model.dart';
import 'package:graduation_project/features/home/domain/repositories/trip_repository.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final TripRepository _tripRepository;
  StreamSubscription? _tripsSubscription;

  HomeCubit(this._tripRepository) : super(const HomeState());

  void updateIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void updateCategory(String? category) {
    if (state.selectedCategory == category) {
      emit(state.copyWith(selectedCategory: () => null)); 
    } else {
      emit(state.copyWith(selectedCategory: () => category));
    }
  }

  void toggleFavorite(Attraction attraction) {
    final List<Attraction> updatedFavorites = List.from(state.favorites);
    if (updatedFavorites.any((element) => element.id == attraction.id)) {
      updatedFavorites.removeWhere((element) => element.id == attraction.id);
    } else {
      updatedFavorites.add(attraction);
    }
    emit(state.copyWith(favorites: updatedFavorites));
  }

  void loadUserTrips(String userId) {
    _tripsSubscription?.cancel();
    emit(state.copyWith(isLoading: true));
    
    _tripsSubscription = _tripRepository.getTrips(userId).listen(
      (trips) {
        emit(state.copyWith(trips: trips, isLoading: false));
      },
      onError: (error) {
        emit(state.copyWith(isLoading: false, errorMessage: error.toString()));
      },
    );
  }

  void clearTrips() {
    _tripsSubscription?.cancel();
    emit(state.copyWith(trips: [], selectedTrip: null, searchQuery: ''));
  }

  void selectTrip(Trip trip) {
    emit(state.copyWith(selectedTrip: trip));
  }

  Future<void> createTrip(Trip trip) async {
    try {
      await _tripRepository.createTrip(trip);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> updateBudget(double totalBudget) async {
    if (state.selectedTrip == null) return;
    
    final updatedTrip = state.selectedTrip!.copyWith(budget: totalBudget);
    try {
      await _tripRepository.updateTrip(updatedTrip);
      emit(state.copyWith(selectedTrip: updatedTrip));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> addActivity(Map<String, dynamic> activity) async {
    if (state.selectedTrip == null) return;
    
    final activities = List<Map<String, dynamic>>.from(state.selectedTrip!.activities)..add(activity);
    await updateActivities(activities);
  }

  Future<void> updateActivities(List<Map<String, dynamic>> activities) async {
    if (state.selectedTrip == null) return;

    final updatedTrip = state.selectedTrip!.copyWith(activities: activities);
    
    try {
      await _tripRepository.updateTrip(updatedTrip);
      emit(state.copyWith(selectedTrip: updatedTrip));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _tripsSubscription?.cancel();
    return super.close();
  }
}
