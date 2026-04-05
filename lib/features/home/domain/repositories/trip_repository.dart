import 'package:graduation_project/features/home/data/models/trip_model.dart';

abstract class TripRepository {
  Stream<List<Trip>> getTrips(String userId);
  Future<void> createTrip(Trip trip);
  Future<void> updateTrip(Trip trip);
  Future<void> deleteTrip(String tripId);
}
