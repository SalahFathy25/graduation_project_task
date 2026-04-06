import 'dart:ui';
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
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            pinned: true,
            stretch: true,
            backgroundColor: AppColors.primary,
            elevation: 0,
            leading: _buildCircularButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final isFavorite = state.favorites.any((fav) => fav.id == widget.city['id']);
                  return _buildCircularButton(
                    icon: isFavorite ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                    iconColor: isFavorite ? AppColors.secondary : Colors.white,
                    onPressed: () {
                      final cityAttraction = Attraction(
                        id: widget.city['id'],
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
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground, StretchMode.blurBackground],
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.city['name'],
                    style: GoogleFonts.almarai(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 22,
                      shadows: [Shadow(color: Colors.black.withOpacity(0.5), blurRadius: 10)],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(width: 40, height: 3, decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 45),
                ],
              ),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'city_image_${widget.city['name']}',
                    child: Image.network(widget.city['image'], fit: BoxFit.cover),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.9),
                        ],
                        stops: const [0.0, 0.4, 0.8, 1.0],
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
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), offset: const Offset(0, -5), blurRadius: 10)
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLuxuryInfoCard(l10n),
                  const SizedBox(height: 32),

                  _buildSectionTitle(l10n.aboutCity),
                  const SizedBox(height: 16),
                  Text(
                    widget.city['desc'],
                    style: GoogleFonts.almarai(
                      fontSize: 16,
                      color: AppColors.textPrimary.withOpacity(0.8),
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 32),

                  if (topPlaces.isNotEmpty) ...[
                    _buildSectionTitle(l10n.topPlaces),
                    const SizedBox(height: 16),
                    ...topPlaces.map((place) => _buildLuxuryPlaceItem(place)).toList(),
                    const SizedBox(height: 32),
                  ],

                  if (activities.isNotEmpty) ...[
                    _buildSectionTitle(l10n.activities),
                    const SizedBox(height: 16),
                    ...activities.entries.map((entry) => _buildLuxuryExpandableList(entry.key, entry.value)).toList(),
                  ],

                  const SizedBox(height: 140),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: _buildPremiumFAB(context, l10n),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildCircularButton({required IconData icon, required VoidCallback onPressed, Color iconColor = Colors.white}) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: IconButton(
            icon: Icon(icon, color: iconColor, size: 20),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 24,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: GoogleFonts.almarai(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildLuxuryInfoCard(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.08),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildInfoIcon(Icons.location_on_rounded, AppColors.primary),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'الموقع',
                      style: GoogleFonts.almarai(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.city['location'],
                      style: GoogleFonts.almarai(fontSize: 16, color: AppColors.textPrimary, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: Colors.grey.withOpacity(0.1), thickness: 1),
          ),
          Row(
            children: [
              _buildInfoIcon(Icons.wb_sunny_rounded, Colors.orange),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.weatherToday,
                      style: GoogleFonts.almarai(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${widget.city['weather']} - ${widget.city['weatherDesc']}',
                      style: GoogleFonts.almarai(fontSize: 16, color: AppColors.textPrimary, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoIcon(IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: color, size: 24),
    );
  }

  Widget _buildLuxuryPlaceItem(String place) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.stars_rounded, color: AppColors.secondary, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              place,
              style: GoogleFonts.almarai(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
            ),
          ),
          Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey.withOpacity(0.5)),
        ],
      ),
    );
  }

  Widget _buildLuxuryExpandableList(String title, List<String> items) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: AppColors.primary,
          collapsedIconColor: AppColors.textSecondary,
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          title: Text(
            title,
            style: GoogleFonts.almarai(fontWeight: FontWeight.w700, fontSize: 17, color: AppColors.primary),
          ),
          children: items.map((item) => Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.check_circle_rounded, color: AppColors.secondary, size: 20),
              title: Text(item, style: GoogleFonts.almarai(fontSize: 14, fontWeight: FontWeight.w500)),
            ),
          )).toList(),
        ),
      ),
    );
  }

  Widget _buildPremiumFAB(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: double.infinity,
      height: 65,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          gradient: const LinearGradient(
            colors: [AppColors.primary, Color(0xFF00642D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ElevatedButton(
          onPressed: () => _showCreateTrip(context, widget.city['name'], l10n),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.auto_awesome_rounded, color: AppColors.secondary, size: 28),
              const SizedBox(width: 12),
              Text(
                l10n.quickPlan,
                style: GoogleFonts.almarai(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
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
