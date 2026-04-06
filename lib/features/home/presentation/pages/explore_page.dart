import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/core/utils/app_constants.dart';
import 'package:graduation_project/features/home/presentation/pages/city_details_page.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_cubit.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_state.dart';
import 'package:graduation_project/features/attractions/domain/entities/attraction.dart';
import '../../../../l10n/app_localizations.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String _selectedRegion = 'all';
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final List<Map<String, dynamic>> allCities = AppConstants.getCities(l10n, isArabic);
    final featuredCities = allCities.where((c) => (c['rating'] as num) >= 4.8).toList();

    final filteredCities = allCities.where((city) {
      final matchesRegion = _selectedRegion == 'all' || city['region'] == _selectedRegion;
      final matchesSearch = city['name'].toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesRegion && matchesSearch;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // 1. Cinematic Header with Integrated Search
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            elevation: 0,
            backgroundColor: AppColors.primary,
            stretch: true,
            // Title appears only when collapsed
            centerTitle: true,
            title: _searchQuery.isEmpty ? null : Text(
              l10n.explore,
              style: GoogleFonts.almarai(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [StretchMode.zoomBackground],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.primary, Color(0xFF005A2B)],
                      ),
                    ),
                  ),
                  // Decorative Pattern
                  Positioned(
                    top: -30,
                    right: -30,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white.withOpacity(0.05),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          isArabic ? 'اكتشف سحر' : 'Discover the Magic of',
                          style: GoogleFonts.almarai(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          isArabic ? 'المملكة العربية السعودية' : 'Saudi Arabia',
                          style: GoogleFonts.almarai(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Search Bar Integrated at the bottom of AppBar
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Transform.translate(
                offset: const Offset(0, 20), // Keeps it half-out
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) => setState(() => _searchQuery = value),
                      decoration: InputDecoration(
                        hintText: l10n.searchHint,
                        hintStyle: GoogleFonts.almarai(color: Colors.grey[400], fontSize: 14),
                        prefixIcon: const Icon(Icons.search_rounded, color: AppColors.primary),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Spacer to prevent content from being hidden under the floating search bar
          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // 3. Featured Destinations (Horizontal)
          if (_searchQuery.isEmpty && _selectedRegion == 'all') ...[
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isArabic ? 'وجهات نوصي بها' : 'Top Destinations',
                          style: GoogleFonts.almarai(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            l10n.viewAll,
                            style: GoogleFonts.almarai(color: AppColors.primary, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredCities.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final city = featuredCities[index];
                        return _buildFeaturedCard(city);
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],

          // 4. Region Filters
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Text(
                    isArabic ? 'استكشف المناطق' : 'Explore Regions',
                    style: GoogleFonts.almarai(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildRegionChip('all', isArabic ? 'الكل' : 'All', Icons.map_rounded),
                      _buildRegionChip('central', isArabic ? 'الوسطى' : 'Central', Icons.center_focus_strong),
                      _buildRegionChip('western', isArabic ? 'الغربية' : 'Western', Icons.wb_sunny_rounded),
                      _buildRegionChip('eastern', isArabic ? 'الشرقية' : 'Eastern', Icons.waves_rounded),
                      _buildRegionChip('southern', isArabic ? 'الجنوبية' : 'Southern', Icons.landscape_rounded),
                      _buildRegionChip('northwestern', isArabic ? 'الشمالية الغربية' : 'Northwest', Icons.ac_unit_rounded),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // 5. Main Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: filteredCities.isEmpty
                ? SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off_rounded, size: 64, color: Colors.grey[300]),
                          const SizedBox(height: 16),
                          Text(
                            isArabic ? 'لا توجد نتائج' : 'No results found',
                            style: GoogleFonts.almarai(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  )
                : SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _buildCityCard(filteredCities[index]),
                      childCount: filteredCities.length,
                    ),
                  ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildFeaturedCard(Map<String, dynamic> city) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CityDetailsPage(city: city))),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: NetworkImage(city['image']),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
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
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    '${city['rating']}',
                    style: GoogleFonts.almarai(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCityCard(Map<String, dynamic> city) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CityDetailsPage(city: city))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 6)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Hero(
                    tag: 'city_image_${city['id']}',
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                        image: DecorationImage(image: NetworkImage(city['image']), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        final isFavorite = state.favorites.any((fav) => fav.id == city['id']);
                        return GestureDetector(
                          onTap: () {
                            final attraction = Attraction(
                              id: city['id'],
                              name: city['name'],
                              description: city['desc'],
                              imageUrl: city['image'],
                              location: city['location'] ?? city['name'],
                              estimatedBudgetPerDay: 0,
                              priceCategory: 2,
                              suitablePurposes: const [],
                            );
                            context.read<HomeCubit>().toggleFavorite(attraction);
                          },
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white.withOpacity(0.9),
                            child: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.grey,
                              size: 16,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city['name'],
                    style: GoogleFonts.almarai(fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 12),
                      const SizedBox(width: 4),
                      Text('${city['rating']}', style: GoogleFonts.almarai(fontSize: 11, color: Colors.grey[600])),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegionChip(String id, String label, IconData icon) {
    final isSelected = _selectedRegion == id;
    return GestureDetector(
      onTap: () => setState(() => _selectedRegion = id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppColors.primary : Colors.grey[200]!),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: isSelected ? Colors.white : Colors.grey[600]),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.almarai(
                color: isSelected ? Colors.white : Colors.grey[600],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
