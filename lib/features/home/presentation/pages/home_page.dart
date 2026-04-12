import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/features/home/data/models/trip_model.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_cubit.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_state.dart';
import 'package:graduation_project/features/home/presentation/pages/my_trips_page.dart';
import 'package:graduation_project/features/home/presentation/pages/city_details_page.dart';
import 'package:graduation_project/features/home/presentation/pages/explore_page.dart';
import 'package:graduation_project/features/home/presentation/pages/favorites_page.dart';
import 'package:graduation_project/features/auth/presentation/pages/profile_page.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_state.dart';
import 'package:graduation_project/core/utils/app_constants.dart';

import '../../../../l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          body: _buildCurrentPage(state.currentIndex, l10n, isArabic, state),
          bottomNavigationBar: _buildModernBottomNav(context, state.currentIndex, l10n),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              final authState = context.read<AuthCubit>().state;
              if (authState is Authenticated) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyTripsPage()));
              } else {
                _showLoginRequiredDialog(context, isArabic);
              }
            },
            backgroundColor: AppColors.primary,
            child: const Icon(Icons.add_rounded, color: Colors.white, size: 30),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }

  Widget _buildCurrentPage(int index, AppLocalizations l10n, bool isArabic, HomeState state) {
    switch (index) {
      case 1:
        return const ExplorePage();
      case 2:
        return const FavoritesPage();
      case 3:
        return const ProfilePage();
      case 0:
      default:
        return _buildHomeBody(l10n, isArabic, state);
    }
  }

  Widget _buildHomeBody(AppLocalizations l10n, bool isArabic, HomeState state) {
    final List<Map<String, dynamic>> allCities = AppConstants.getCities(l10n, isArabic);

    final filteredCities = allCities.where((city) {
      final query = state.searchQuery.toLowerCase();
      final matchesSearch = city['name'].toString().toLowerCase().contains(query) ||
          city['desc'].toString().toLowerCase().contains(query);
      
      final matchesCategory = state.selectedCategory == null || 
          (city['categories'] as List).contains(state.selectedCategory);
          
      return matchesSearch && matchesCategory;
    }).toList();

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 180.0,
          floating: false,
          pinned: true,
          backgroundColor: AppColors.primary,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.primary, Color(0xFF00642E)],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.welcome,
                              style: GoogleFonts.almarai(color: Colors.white70, fontSize: 14),
                            ),
                            Text(
                              l10n.appTitle,
                              style: GoogleFonts.almarai(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () => context.read<HomeCubit>().updateIndex(3),
                          child: const CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white24,
                            child: Icon(Icons.person_outline, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) => context.read<HomeCubit>().updateSearchQuery(value),
                    decoration: InputDecoration(
                      icon: const Icon(Icons.search, color: AppColors.primary),
                      hintText: l10n.searchHint,
                      hintStyle: GoogleFonts.almarai(color: Colors.grey, fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCategoryItem(context, l10n.adventure, Icons.terrain_rounded, 'adventure', state.selectedCategory == 'adventure'),
                      _buildCategoryItem(context, l10n.family, Icons.family_restroom_rounded, 'family', state.selectedCategory == 'family'),
                      _buildCategoryItem(context, l10n.religious, Icons.mosque_rounded, 'religious', state.selectedCategory == 'religious'),
                      _buildCategoryItem(context, l10n.business, Icons.business_center_rounded, 'business', state.selectedCategory == 'business'),
                      _buildCategoryItem(context, l10n.luxury, Icons.diamond_rounded, 'luxury', state.selectedCategory == 'luxury'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildPersonalizedSection(context, state, l10n, isArabic),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.recommendedDestinations,
                      style: GoogleFonts.almarai(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () => context.read<HomeCubit>().updateIndex(1),
                      child: Text(
                        l10n.viewAll,
                        style: GoogleFonts.almarai(
                            color: AppColors.primary, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 245,
            child: filteredCities.isEmpty
              ? Center(child: Text(isArabic ? 'لا توجد نتائج' : 'No results found'))
              : ListView.builder(
                  padding: const EdgeInsets.only(right: 20, left: 4),
                  scrollDirection: Axis.horizontal,
                  itemCount: filteredCities.length,
                  itemBuilder: (context, index) {
                    final city = filteredCities[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CityDetailsPage(city: city),
                          ),
                        );
                      },
                      child: Container(
                        width: 160,
                        margin: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                city['image'],
                                height: 180,
                                width: 160,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(color: Colors.grey[200]),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              city['name'],
                              style: GoogleFonts.almarai(fontWeight: FontWeight.bold, fontSize: 15),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              city['desc'],
                              style: GoogleFonts.almarai(color: Colors.grey, fontSize: 11),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 120)),
      ],
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, IconData icon, String category, bool isSelected) {
    return GestureDetector(
      onTap: () => context.read<HomeCubit>().updateCategory(category),
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isSelected ? Colors.white : AppColors.primary, size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.almarai(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalizedSection(BuildContext context, HomeState state, AppLocalizations l10n, bool isArabic) {
    final authState = context.read<AuthCubit>().state;
    if (authState is! Authenticated) {
      if (state.trips.isNotEmpty) {
        return _buildActiveTripSummary(context, state.trips.first, l10n);
      }
      return const SizedBox.shrink();
    }

    final user = authState.user;
    final String travelerType = user.travelerType ?? 'Moderate';
    final String travelPurpose = user.travelPurpose ?? 'Family';

    // Filter cities based on user profile
    final allCities = AppConstants.getCities(l10n, isArabic);
    final suggestedCities = allCities.where((city) {
      final categories = (city['categories'] as List);
      final matchesPurpose = categories.any((cat) => cat.toString().toLowerCase() == travelPurpose.toLowerCase());
      
      // For traveler type, we might need more logic, but for now we match by category keywords
      bool matchesType = true;
      if (travelerType.toLowerCase() == 'luxury') {
        matchesType = categories.contains('luxury');
      } else if (travelerType.toLowerCase() == 'economic') {
        matchesType = !categories.contains('luxury');
      }

      return matchesPurpose || matchesType;
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (state.trips.isNotEmpty) ...[
          _buildActiveTripSummary(context, state.trips.first, l10n),
          const SizedBox(height: 24),
        ],
        Text(
          isArabic ? 'اقتراحات خصيصاً لك' : 'Specially for you',
          style: GoogleFonts.almarai(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          isArabic 
            ? 'بناءً على تفضيلاتك كمسافر ($travelerType) و غرض ($travelPurpose)'
            : 'Based on your profile ($travelerType, $travelPurpose)',
          style: GoogleFonts.almarai(fontSize: 12, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: suggestedCities.length,
            itemBuilder: (context, index) {
              final city = suggestedCities[index];
              return _buildSmallSuggestionCard(context, city);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSmallSuggestionCard(BuildContext context, Map<String, dynamic> city) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CityDetailsPage(city: city))),
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(city['image']),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                city['name'],
                style: GoogleFonts.almarai(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                city['desc'],
                style: GoogleFonts.almarai(color: Colors.white70, fontSize: 11),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLoginRequiredDialog(BuildContext context, bool isArabic) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isArabic ? 'تسجيل الدخول مطلوب' : 'Login Required'),
        content: Text(isArabic
          ? 'يجب تسجيل الدخول لتتمكن من إضافة وإدارة رحلاتك.'
          : 'You must log in to be able to add and manage your trips.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(isArabic ? 'إلغاء' : 'Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthCubit>().logout();
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: Text(isArabic ? 'تسجيل الدخول' : 'Login', style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveTripSummary(BuildContext context, Trip trip, AppLocalizations l10n) {
    double progress = (trip.budget == 0 ? 1.0 : (trip.spent / trip.budget)).clamp(0.0, 1.0).toDouble();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: const NetworkImage('https://www.transparenttextures.com/patterns/cubes.png'),
          opacity: 0.1,
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.1), BlendMode.srcATop),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${l10n.activeTrip}: ${trip.name}',
                style: GoogleFonts.almarai(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Icon(Icons.flight_takeoff_rounded, color: Colors.white),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.budget,
                style: GoogleFonts.almarai(color: Colors.white70, fontSize: 12),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: GoogleFonts.almarai(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white24,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.secondary),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernBottomNav(BuildContext context, int currentIndex, AppLocalizations l10n) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(context, 0, Icons.home_rounded, Icons.home_outlined, l10n.home, currentIndex == 0),
              _navItem(context, 1, Icons.explore_rounded, Icons.explore_outlined, l10n.explore, currentIndex == 1),
              const SizedBox(width: 48), // Space for FAB
              _navItem(context, 2, Icons.bookmark_rounded, Icons.bookmark_outline_rounded, l10n.favorites, currentIndex == 2),
              _navItem(context, 3, Icons.person_rounded, Icons.person_outline_rounded, l10n.profile, currentIndex == 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, int index, IconData selectedIcon, IconData unselectedIcon, String label, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => context.read<HomeCubit>().updateIndex(index),
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  isSelected ? selectedIcon : unselectedIcon,
                  color: isSelected ? AppColors.primary : Colors.grey[400],
                  size: 26,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: GoogleFonts.almarai(
                  fontSize: 11,
                  color: isSelected ? AppColors.primary : Colors.grey[400],
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
