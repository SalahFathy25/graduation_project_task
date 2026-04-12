import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/features/home/data/models/trip_model.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_cubit.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../l10n/app_localizations.dart';

class TripItineraryPage extends StatefulWidget {
  final Trip trip;
  const TripItineraryPage({super.key, required this.trip});

  @override
  State<TripItineraryPage> createState() => _TripItineraryPageState();
}

class _TripItineraryPageState extends State<TripItineraryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};

  // Mock coordinates for cities
  final Map<String, LatLng> _cityCoordinates = {
    'Riyadh': const LatLng(24.7136, 46.6753),
    'الرياض': const LatLng(24.7136, 46.6753),
    'Jeddah': const LatLng(21.4858, 39.1925),
    'جدة': const LatLng(21.4858, 39.1925),
    'AlUla': const LatLng(26.6200, 37.9231),
    'العلا': const LatLng(26.6200, 37.9231),
    'Abha': const LatLng(18.2164, 42.5053),
    'أبها': const LatLng(18.2164, 42.5053),
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadMarkers();
  }

  void _loadMarkers() {
    final cityLatLng = _cityCoordinates[widget.trip.city] ?? const LatLng(24.7136, 46.6753);
    
    _markers.clear();
    _markers.add(
      Marker(
        markerId: const MarkerId('city_center'),
        position: cityLatLng,
        infoWindow: InfoWindow(title: widget.trip.city),
      ),
    );

    for (var i = 0; i < widget.trip.activities.length; i++) {
      final activity = widget.trip.activities[i];
      final latOffset = (i + 1) * 0.01;
      final lngOffset = (i + 1) * 0.01;
      
      _markers.add(
        Marker(
          markerId: MarkerId('activity_$i'),
          position: LatLng(cityLatLng.latitude + latOffset, cityLatLng.longitude + lngOffset),
          infoWindow: InfoWindow(
            title: activity['title'],
            snippet: '${activity['startTime']} - ${activity['endTime']}',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        ),
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final currentTrip = state.selectedTrip ?? widget.trip;
        final activities = currentTrip.activities;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              '${l10n.tripItinerary} ${currentTrip.name}',
              style: GoogleFonts.almarai(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorColor: AppColors.secondary,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Tab(text: l10n.dailyItinerary, icon: const Icon(Icons.list_alt_rounded)),
                Tab(text: l10n.localeName == 'ar' ? 'الخريطة' : 'Map', icon: const Icon(Icons.map_rounded)),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              _buildListView(activities, l10n),
              _buildMapView(currentTrip),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListView(List<Map<String, dynamic>> activities, AppLocalizations l10n) {
    if (activities.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event_busy_rounded, size: 80, color: Colors.grey[300]),
            const SizedBox(height: 16),
            Text(
              l10n.noActivitiesYet,
              style: GoogleFonts.almarai(color: AppColors.textSecondary),
            ),
          ],
        ),
      );
    }

    return ReorderableListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      itemCount: activities.length,
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) newIndex -= 1;
        final List<Map<String, dynamic>> updatedActivities = List.from(activities);
        final item = updatedActivities.removeAt(oldIndex);
        updatedActivities.insert(newIndex, item);
        context.read<HomeCubit>().updateActivities(updatedActivities);
      },
      itemBuilder: (context, index) {
        final activity = activities[index];
        return _buildModernActivityItem(context, activity, index == activities.length - 1, l10n, index);
      },
    );
  }

  Widget _buildMapView(Trip trip) {
    final cityLatLng = _cityCoordinates[trip.city] ?? const LatLng(24.7136, 46.6753);
    _loadMarkers(); // Update markers when trip changes
    
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: cityLatLng,
        zoom: 12,
      ),
      onMapCreated: (controller) => _mapController = controller,
      markers: _markers,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: true,
    );
  }

  Widget _buildModernActivityItem(BuildContext context, Map<String, dynamic> activity, bool isLast, AppLocalizations l10n, int index) {
    return IntrinsicHeight(
      key: ValueKey('activity_$index'),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Line
          Column(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.primary,
                          AppColors.primary.withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          // Activity Card
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${l10n.day} ${activity['day'] ?? '1'}',
                          style: GoogleFonts.almarai(
                            color: AppColors.primary,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.access_time_rounded, size: 14, color: AppColors.primary),
                          const SizedBox(width: 4),
                          Text(
                            (activity['startTime'] ?? activity['time'] ?? '10:00').toString(),
                            style: GoogleFonts.almarai(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.drag_handle_rounded, color: Colors.grey, size: 20),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    activity['title'] ?? '',
                    style: GoogleFonts.almarai(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (activity['notes'] != null && activity['notes'].toString().isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      activity['notes'].toString(),
                      style: GoogleFonts.almarai(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => _deleteActivity(index),
                        icon: const Icon(Icons.delete_outline_rounded, color: Colors.redAccent, size: 20),
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                      Text(
                        '${l10n.endsAt}: ${activity['endTime'] ?? '12:00'}',
                        style: GoogleFonts.almarai(
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _deleteActivity(int index) {
    final List<Map<String, dynamic>> updatedActivities = List.from(context.read<HomeCubit>().state.selectedTrip!.activities);
    updatedActivities.removeAt(index);
    context.read<HomeCubit>().updateActivities(updatedActivities);
  }
}
