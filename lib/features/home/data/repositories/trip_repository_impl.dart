import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/features/home/data/models/trip_model.dart';
import 'package:graduation_project/features/home/domain/repositories/trip_repository.dart';

class TripRepositoryImpl implements TripRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<Trip>> getTrips(String userId) {
    return _firestore
        .collection('trips')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        // Ensure the ID from Firestore is used if not in data
        return Trip.fromMap({...data, 'id': doc.id});
      }).toList();
    });
  }

  @override
  Future<void> createTrip(Trip trip) async {
    final docRef = _firestore.collection('trips').doc();
    final newTrip = trip.copyWith(id: docRef.id);
    await docRef.set(newTrip.toMap());
  }

  @override
  Future<void> updateTrip(Trip trip) async {
    await _firestore.collection('trips').doc(trip.id).update(trip.toMap());
  }

  @override
  Future<void> deleteTrip(String tripId) async {
    await _firestore.collection('trips').doc(tripId).delete();
  }
}
