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
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/cubit/auth_state.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String _selectedRegion = 'all';
  String _selectedCategory = 'all';
  double _minPrice = 0;
  double _maxPrice = 5000;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterBottomSheet(AppLocalizations l10n, bool isArabic) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 24,
            right: 24,
            bottom: MediaQuery.of(context).viewInsets.bottom + 32,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isArabic ? 'تصفية النتائج' : 'Filter Results',
                    style: GoogleFonts.almarai(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      setModalState(() {
                        _selectedRegion = 'all';
                        _selectedCategory = 'all';
                        _minPrice = 0;
                        _maxPrice = 5000;
                      });
                      setState(() {});
                    },
                    child: Text(isArabic ? 'إعادة ضبط' : 'Reset'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(isArabic ? 'الفئة' : 'Category',
                  style: GoogleFonts.almarai(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                children: [
                  _buildFilterChip('all', isArabic ? 'الكل' : 'All', _selectedCategory == 'all',
                      (val) {
                    setModalState(() => _selectedCategory = 'all');
                    setState(() {});
                  }),
                  _buildFilterChip('adventure', l10n.adventure, _selectedCategory == 'adventure',
                      (val) {
                    setModalState(() => _selectedCategory = 'adventure');
                    setState(() {});
                  }),
                  _buildFilterChip('family', l10n.family, _selectedCategory == 'family', (val) {
                    setModalState(() => _selectedCategory = 'family');
                    setState(() {});
                  }),
                  _buildFilterChip('religious', l10n.religious, _selectedCategory == 'religious',
                      (val) {
                    setModalState(() => _selectedCategory = 'religious');
                    setState(() {});
                  }),
                ],
              ),
              const SizedBox(height: 24),
              Text(isArabic ? 'نطاق السعر (ريال)' : 'Price Range (SAR)',
                  style: GoogleFonts.almarai(fontWeight: FontWeight.bold)),
              RangeSlider(
                values: RangeValues(_minPrice, _maxPrice),
                min: 0,
                max: 5000,
                divisions: 20,
                activeColor: AppColors.primary,
                labels: RangeLabels('$_minPrice', '$_maxPrice'),
                onChanged: (values) {
                  setModalState(() {
                    _minPrice = values.start;
                    _maxPrice = values.end;
                  });
                  setState(() {});
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$_minPrice ريال',
                      style: GoogleFonts.almarai(fontSize: 12, color: Colors.grey)),
                  Text('$_maxPrice ريال',
                      style: GoogleFonts.almarai(fontSize: 12, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: Text(isArabic ? 'تطبيق' : 'Apply',
                      style: GoogleFonts.almarai(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(String id, String label, bool isSelected, Function(bool) onSelected) {
    return FilterChip(
      label: Text(label,
          style:
              GoogleFonts.almarai(fontSize: 12, color: isSelected ? Colors.white : Colors.black)),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: AppColors.primary,
      checkmarkColor: Colors.white,
      backgroundColor: Colors.grey[100],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: isSelected ? AppColors.primary : Colors.grey[200]!, width: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final authState = context.watch<AuthCubit>().state;
    String? userType;
    String? userPurpose;
    if (authState is Authenticated) {
      userType = authState.user.travelerType;
      userPurpose = authState.user.travelPurpose;
    }

    final List<Map<String, dynamic>> allCities = AppConstants.getCities(l10n, isArabic);
    final featuredCities = allCities.where((c) => (c['rating'] as num) >= 4.8).toList();

    // Recommendation Logic (Requirement 7)
    final recommendedCities = allCities.where((city) {
      if (userPurpose == null) return false;
      final cityCategories = city['categories'] as List;
      final cityName = city['name'].toLowerCase();

      // Enhanced Recommendation Logic
      if (userPurpose!.toLowerCase().contains('adventure') || userPurpose!.contains('مغامرة')) {
        // Prioritize Abha and Jeddah for adventurers
        if (cityName.contains('abha') || cityName.contains('أبها') || 
            cityName.contains('jeddah') || cityName.contains('جدة')) {
          return true;
        }
        return cityCategories.contains('adventure');
      }
      if (userPurpose!.toLowerCase().contains('family') || userPurpose!.contains('عائلة')) {
        // Prioritize Taif and Riyadh for families
        if (cityName.contains('taif') || cityName.contains('طائف') || 
            cityName.contains('riyadh') || cityName.contains('رياض')) {
          return true;
        }
        return cityCategories.contains('family');
      }
      if (userPurpose!.toLowerCase().contains('religious') || userPurpose!.contains('ديني')) {
        // Prioritize Mecca and Medina for religious travelers
        if (cityName.contains('mecca') || cityName.contains('مكة') || 
            cityName.contains('medina') || cityName.contains('مدينة')) {
          return true;
        }
        return cityCategories.contains('religious');
      }
      if (userPurpose!.toLowerCase().contains('business') || userPurpose!.contains('أعمال')) {
        return cityCategories.contains('business');
      }
      return false;
    }).toList();

    // Sort recommendations to put prioritized cities first
    recommendedCities.sort((a, b) {
      final aName = a['name'].toLowerCase();
      final bName = b['name'].toLowerCase();

      if (userPurpose!.toLowerCase().contains('adventure') || userPurpose!.contains('مغامرة')) {
        bool aPri = aName.contains('abha') || aName.contains('أبها') || aName.contains('jeddah') || aName.contains('جدة');
        bool bPri = bName.contains('abha') || bName.contains('أبها') || bName.contains('jeddah') || bName.contains('جدة');
        if (aPri && !bPri) return -1;
        if (!aPri && bPri) return 1;
      } else if (userPurpose!.toLowerCase().contains('family') || userPurpose!.contains('عائلة')) {
        bool aPri = aName.contains('taif') || aName.contains('طائف') || aName.contains('riyadh') || aName.contains('رياض');
        bool bPri = bName.contains('taif') || bName.contains('طائف') || bName.contains('riyadh') || bName.contains('رياض');
        if (aPri && !bPri) return -1;
        if (!aPri && bPri) return 1;
      } else if (userPurpose!.toLowerCase().contains('religious') || userPurpose!.contains('ديني')) {
        bool aPri = aName.contains('mecca') || aName.contains('مكة') || aName.contains('medina') || aName.contains('مدينة');
        bool bPri = bName.contains('mecca') || bName.contains('مكة') || bName.contains('medina') || bName.contains('مدينة');
        if (aPri && !bPri) return -1;
        if (!aPri && bPri) return 1;
      }
      return 0;
    });

    final filteredCities = allCities.where((city) {
      final matchesRegion = _selectedRegion == 'all' || city['region'] == _selectedRegion;
      final matchesSearch = city['name'].toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory =
          _selectedCategory == 'all' || (city['categories'] as List).contains(_selectedCategory);
      // Assuming cities have a base price or we use a dummy for filtering logic demonstration
      final cityPrice = (city['price'] ?? 500).toDouble();
      final matchesPrice = cityPrice >= _minPrice && cityPrice <= _maxPrice;

      return matchesRegion && matchesSearch && matchesCategory && matchesPrice;
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
            title: _searchQuery.isEmpty
                ? null
                : Text(
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
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) => setState(() => _searchQuery = value),
                            decoration: InputDecoration(
                              hintText: l10n.searchHint,
                              hintStyle: GoogleFonts.almarai(color: Colors.grey[400], fontSize: 14),
                              prefixIcon:
                                  const Icon(Icons.search_rounded, color: AppColors.primary),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            onPressed: () => _showFilterBottomSheet(l10n, isArabic),
                            icon: const Icon(Icons.tune_rounded, color: AppColors.primary),
                            style: IconButton.styleFrom(
                              backgroundColor: AppColors.primary.withOpacity(0.05),
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Spacer to prevent content from being hidden under the floating search bar
          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // 3. Recommended for you (Requirement 7 & 2)
          if (_searchQuery.isEmpty && _selectedRegion == 'all' && recommendedCities.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.auto_awesome_rounded,
                                color: AppColors.secondary, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              isArabic ? 'نوصي به لك ✨' : 'Recommended for You',
                              style: GoogleFonts.almarai(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
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
                      itemCount: recommendedCities.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final city = recommendedCities[index];
                        return _buildFeaturedCard(city);
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],

          // 3.5. Featured Destinations (Horizontal)
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
                      _buildRegionChip(
                          'central', isArabic ? 'الوسطى' : 'Central', Icons.center_focus_strong),
                      _buildRegionChip(
                          'western', isArabic ? 'الغربية' : 'Western', Icons.wb_sunny_rounded),
                      _buildRegionChip(
                          'eastern', isArabic ? 'الشرقية' : 'Eastern', Icons.waves_rounded),
                      _buildRegionChip(
                          'southern', isArabic ? 'الجنوبية' : 'Southern', Icons.landscape_rounded),
                      _buildRegionChip('northwestern', isArabic ? 'الشمالية الغربية' : 'Northwest',
                          Icons.ac_unit_rounded),
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
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => CityDetailsPage(city: city))),
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
                style: GoogleFonts.almarai(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
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
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => CityDetailsPage(city: city))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.04), blurRadius: 12, offset: const Offset(0, 6)),
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
                        image:
                            DecorationImage(image: NetworkImage(city['image']), fit: BoxFit.cover),
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
                      Text('${city['rating']}',
                          style: GoogleFonts.almarai(fontSize: 11, color: Colors.grey[600])),
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
