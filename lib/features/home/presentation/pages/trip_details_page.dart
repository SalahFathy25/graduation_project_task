import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/features/home/data/models/trip_model.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_cubit.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_state.dart';
import 'package:graduation_project/features/home/presentation/widgets/budget_bottom_sheet.dart';
import 'package:graduation_project/features/home/presentation/widgets/add_activity_bottom_sheet.dart';
import 'package:graduation_project/features/home/presentation/pages/trip_itinerary_page.dart';

import 'package:graduation_project/core/utils/app_constants.dart';
import '../../../../l10n/app_localizations.dart';

class TripDetailsPage extends StatelessWidget {
  const TripDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final trip = state.selectedTrip;
        if (trip == null) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        final activities = trip.activities;
        final lastActivity = activities.isNotEmpty ? activities.last : null;

        String cityImage = AppConstants.getCityImage(trip.city);

        return Scaffold(
          backgroundColor: AppColors.background,
          body: CustomScrollView(
            slivers: [
              _buildAppBar(context, trip, cityImage),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(trip, l10n),
                      const SizedBox(height: 24),
                      _buildInfoChips(trip, l10n),
                      const SizedBox(height: 32),
                      _buildBudgetCard(context, trip, l10n),
                      const SizedBox(height: 32),
                      _buildActivityPreview(context, lastActivity, l10n),
                      const SizedBox(height: 40),
                      _buildActionButtons(context, trip, l10n),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context, Trip trip, String image) {
    return SliverAppBar(
      expandedHeight: 300.0,
      pinned: true,
      elevation: 0,
      backgroundColor: AppColors.primary,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black26,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(image, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.transparent,
                    AppColors.background,
                  ],
                  stops: const [0.0, 0.6, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Trip trip, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          trip.name,
          style: GoogleFonts.almarai(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.location_on_rounded, size: 18, color: AppColors.primary),
            const SizedBox(width: 6),
            Text(
              trip.city,
              style: GoogleFonts.almarai(
                fontSize: 16,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            const Icon(Icons.calendar_today_rounded, size: 16, color: AppColors.textSecondary),
            const SizedBox(width: 6),
            Text(
              '${trip.startDate} - ${trip.endDate}',
              style: GoogleFonts.almarai(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoChips(Trip trip, AppLocalizations l10n) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        if (trip.travelPurpose != null)
          _buildChip(
            _getPurposeLabel(trip.travelPurpose!, l10n),
            Icons.explore_outlined,
            AppColors.secondary.withOpacity(0.12),
            AppColors.secondary,
          ),
        if (trip.travelerType != null)
          _buildChip(
            _getTypeLabel(trip.travelerType!, l10n),
            Icons.style_outlined,
            AppColors.primary.withOpacity(0.1),
            AppColors.primary,
          ),
      ],
    );
  }

  Widget _buildChip(String label, IconData icon, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: textColor.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.almarai(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetCard(BuildContext context, Trip trip, AppLocalizations l10n) {
    final remaining = trip.budget - trip.spent;
    final progress = trip.budget > 0 ? (trip.spent / trip.budget).clamp(0.0, 1.0) : 0.0;
    final isOverBudget = trip.spent > trip.budget;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.manageBudget,
                      style: GoogleFonts.almarai(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () => _showBudgetSheet(context, trip),
                      icon: const Icon(Icons.edit_note_rounded, color: AppColors.primary),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.primary.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBudgetMetric(l10n.spent, '${trip.spent}', Colors.orange),
                    _buildBudgetMetric(l10n.remaining, '$remaining', isOverBudget ? Colors.red : AppColors.accentGreen),
                    _buildBudgetMetric(l10n.total, '${trip.budget}', AppColors.textPrimary),
                  ],
                ),
                const SizedBox(height: 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 12,
                    backgroundColor: Colors.grey[100],
                    color: isOverBudget ? Colors.red : AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          if (isOverBudget)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.05),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Center(
                child: Text(
                  'لقد تجاوزت الميزانية المحددة!',
                  style: GoogleFonts.almarai(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBudgetMetric(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.almarai(color: AppColors.textSecondary, fontSize: 12)),
        const SizedBox(height: 6),
        Text(
          value,
          style: GoogleFonts.almarai(fontWeight: FontWeight.bold, fontSize: 20, color: color),
        ),
      ],
    );
  }

  Widget _buildActivityPreview(BuildContext context, Map<String, dynamic>? lastActivity, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.dailyItinerary,
              style: GoogleFonts.almarai(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton.icon(
              onPressed: () => _showAddActivitySheet(context),
              icon: const Icon(Icons.add_rounded),
              label: Text(l10n.addActivity),
              style: TextButton.styleFrom(foregroundColor: AppColors.primary),
            ),
          ],
        ),
        const SizedBox(height: 16),
        if (lastActivity != null)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primary.withOpacity(0.08)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.map_rounded, color: AppColors.primary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${l10n.lastActivity}: ${lastActivity['title']}',
                        style: GoogleFonts.almarai(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${l10n.day} ${lastActivity['day']} • ${lastActivity['startTime']}',
                        style: GoogleFonts.almarai(color: AppColors.textSecondary, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded, color: Colors.grey),
              ],
            ),
          )
        else
          _buildEmptyState(l10n),
      ],
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Column(
        children: [
          Icon(Icons.event_note_outlined, size: 48, color: Colors.grey[200]),
          const SizedBox(height: 16),
          Text(
            l10n.noActivitiesYet,
            style: GoogleFonts.almarai(color: AppColors.textSecondary, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context, Trip trip, AppLocalizations l10n) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TripItineraryPage(trip: trip),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              elevation: 4,
              shadowColor: AppColors.primary.withOpacity(0.3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.route_rounded),
                const SizedBox(width: 12),
                Text(
                  l10n.viewFullItinerary,
                  style: GoogleFonts.almarai(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getPurposeLabel(String purpose, AppLocalizations l10n) {
    switch (purpose.toLowerCase()) {
      case 'adventure': return l10n.adventure;
      case 'family': return l10n.family;
      case 'religious': return l10n.religious;
      case 'business': return l10n.business;
      default: return purpose;
    }
  }

  String _getTypeLabel(String type, AppLocalizations l10n) {
    switch (type.toLowerCase()) {
      case 'economic': return l10n.economic;
      case 'moderate': return l10n.moderate;
      case 'luxury': return l10n.luxury;
      default: return type;
    }
  }

  void _showBudgetSheet(BuildContext context, Trip trip) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BudgetBottomSheet(trip: trip),
    );
  }

  void _showAddActivitySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddActivityBottomSheet(),
    );
  }
}
