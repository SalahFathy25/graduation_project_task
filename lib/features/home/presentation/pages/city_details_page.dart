import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_state.dart';
import 'package:graduation_project/features/home/presentation/widgets/quick_plan_bottom_sheet.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_cubit.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_state.dart';
import 'package:graduation_project/features/attractions/domain/entities/attraction.dart';

import '../../../../l10n/app_localizations.dart';

class CityDetailsPage extends StatefulWidget {
  final Map<String, dynamic> city;

  const CityDetailsPage({super.key, required this.city});

  @override
  State<CityDetailsPage> createState() => _CityDetailsPageState();
}

class _CityDetailsPageState extends State<CityDetailsPage> {
  String? _userTravelPurpose;
  String? _userTravelerType;

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthCubit>().state;
    if (authState is Authenticated) {
      _userTravelPurpose = authState.user.travelPurpose;
      _userTravelerType = authState.user.travelerType;
    }
  }

  Map<String, List<String>> _getActivities(AppLocalizations l10n) {
    if (widget.city.containsKey('activities') && widget.city['activities'] is Map) {
      final cityActivities = widget.city['activities'] as Map<String, dynamic>;
      return cityActivities.map((key, value) => MapEntry(key, List<String>.from(value)));
    }

    // Fallback to original logic if no specific activities found
    bool isArabic = l10n.localeName == 'ar';
    String purpose = _userTravelPurpose ?? (isArabic ? 'عائلة' : 'Family');
    
    if (purpose == (isArabic ? 'مغامرة' : 'Adventure')) {
      return {
        l10n.activitiesForYou: isArabic
          ? ['جيتسكي', 'رحلة بحرية', 'غوص', 'باراشوت', 'تجربة التحليق بالمنطاد']
          : ['Jet Ski', 'Sea Cruise', 'Diving', 'Parachute', 'Hot Air Balloon'],
      };
    }
    return {
      l10n.activitiesForYou: isArabic
        ? ['جولة في المتاحف', 'زيارة مراكز التسوق', 'الحدائق العامة']
        : ['Museum Tour', 'Shopping Mall Visit', 'Public Parks'],
    };
  }

  List<String> _getTopPlaces(AppLocalizations l10n) {
    if (widget.city.containsKey('topPlaces') && widget.city['topPlaces'] is List) {
      return List<String>.from(widget.city['topPlaces']);
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final activities = _getActivities(l10n);
    final topPlaces = _getTopPlaces(l10n);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // 1. Dynamic Header
          SliverAppBar(
            expandedHeight: 350.0,
            pinned: true,
            backgroundColor: AppColors.primary,
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            actions: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final isFavorite = state.favorites.any((fav) => fav.name == widget.city['name']);
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                        color: isFavorite ? Colors.orange : Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        final cityAttraction = Attraction(
                          id: widget.city['name'],
                          name: widget.city['name'],
                          description: widget.city['desc'] ?? '',
                          imageUrl: widget.city['image'] ?? '',
                          location: widget.city['location'] ?? widget.city['name'],
                          estimatedBudgetPerDay: 0,
                          priceCategory: 2,
                          suitablePurposes: const [],
                        );
                        context.read<HomeCubit>().toggleFavorite(cityAttraction);
                      },
                    ),
                  );
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.city['name'],
                style: GoogleFonts.almarai(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 42),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(widget.city['image'], fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.transparent,
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 2. Weather & Location Card
                  _buildCityInfoCard(l10n),
                  const SizedBox(height: 24),

                  // 3. Description
                  Text(
                    l10n.aboutCity,
                    style: GoogleFonts.almarai(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.city['desc'],
                    style: GoogleFonts.almarai(
                      fontSize: 15,
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 4. Top Places Section
                  if (topPlaces.isNotEmpty) ...[
                    Text(
                      l10n.topPlaces,
                      style: GoogleFonts.almarai(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...topPlaces.map((place) => _buildPlaceItem(place)).toList(),
                    const SizedBox(height: 24),
                  ],

                  // 5. Activities Section (Dropdowns)
                  if (activities.isNotEmpty) ...[
                    Text(
                      l10n.activities,
                      style: GoogleFonts.almarai(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...activities.entries.map((entry) => _buildExpandableList(entry.key, entry.value)).toList(),
                  ],

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        height: 60,
        child: ElevatedButton(

          onPressed: () => _showCreateTrip(context, widget.city['name']  , l10n),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 8,
            shadowColor: AppColors.primary.withOpacity(0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.auto_awesome_rounded, color: Colors.white),
              const SizedBox(width: 12),
              Text(
                l10n.quickPlan,
                style: GoogleFonts.almarai(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildPlaceItem(String place) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              place,
              style: GoogleFonts.almarai(fontSize: 14, color: AppColors.textPrimary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCityInfoCard(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.location_on_rounded, color: AppColors.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  widget.city['location'],
                  style: GoogleFonts.almarai(fontSize: 14, color: AppColors.textPrimary),
                ),
              ),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: [
              const Icon(Icons.wb_sunny_rounded, color: Colors.orange),
              const SizedBox(width: 12),
              Text(
                '${widget.city['weather']} - ${widget.city['weatherDesc']}',
                style: GoogleFonts.almarai(fontSize: 14, color: AppColors.textPrimary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableList(String title, List<String> items) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: GoogleFonts.almarai(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.primary),
        ),
        children: items.map((item) => ListTile(
          leading: const Icon(Icons.check_circle_outline, color: AppColors.secondary, size: 20),
          title: Text(item, style: GoogleFonts.almarai(fontSize: 14)),
        )).toList(),
      ),
    );
  }

  void _showCreateTrip(BuildContext context, String cityName, AppLocalizations l10n) {
    final activities = _getActivities(l10n);
    final allActivities = activities.values.expand((e) => e).toList();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => QuickPlanBottomSheet(
        cityName: cityName,
        availableActivities: allActivities,
      ),
    );
  }
}
