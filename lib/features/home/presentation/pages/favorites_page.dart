import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/core/utils/app_constants.dart';
import 'package:graduation_project/features/home/presentation/pages/city_details_page.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_cubit.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_state.dart';
import 'package:graduation_project/features/attractions/presentation/pages/attraction_details_page.dart';
import 'package:graduation_project/features/attractions/domain/entities/attraction.dart';
import '../../../../l10n/app_localizations.dart';

enum SortOption { name, priceLow, priceHigh }

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  String searchQuery = '';
  String? selectedPurpose;
  int? selectedPriceCategory;
  SortOption currentSort = SortOption.name;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          List<Attraction> filteredList = state.favorites.where((attraction) {
            final matchesSearch = attraction.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
                attraction.location.toLowerCase().contains(searchQuery.toLowerCase());
            final matchesPurpose = selectedPurpose == null || attraction.suitablePurposes.contains(selectedPurpose);
            final matchesPrice = selectedPriceCategory == null || attraction.priceCategory == selectedPriceCategory;
            return matchesSearch && matchesPurpose && matchesPrice;
          }).toList();

          switch (currentSort) {
            case SortOption.name:
              filteredList.sort((a, b) => a.name.compareTo(b.name));
              break;
            case SortOption.priceLow:
              filteredList.sort((a, b) => a.estimatedBudgetPerDay.compareTo(b.estimatedBudgetPerDay));
              break;
            case SortOption.priceHigh:
              filteredList.sort((a, b) => b.estimatedBudgetPerDay.compareTo(a.estimatedBudgetPerDay));
              break;
          }

          final allPurposes = state.favorites.expand((a) => a.suitablePurposes).toSet().toList();

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _buildModernAppBar(l10n, isArabic),

              if (state.favorites.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: _buildFilterSection(allPurposes, isArabic),
                  ),
                ),

              if (state.favorites.isEmpty)
                SliverFillRemaining(hasScrollBody: false, child: _buildEmptyState(context, isArabic))
              else if (filteredList.isEmpty)
                SliverFillRemaining(hasScrollBody: false, child: _buildNoResultsState(isArabic))
              else
                _buildFavoritesGrid(filteredList),

              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildModernAppBar(AppLocalizations l10n, bool isArabic) {
    return SliverAppBar(
      expandedHeight: 220.0,
      floating: false,
      pinned: true,
      elevation: 0,
      backgroundColor: AppColors.primary,
      stretch: true,
      centerTitle: true,
      // Title when collapsed
      title: LayoutBuilder(
        builder: (context, constraints) {
          final top = constraints.biggest.height;
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: top < 110 ? 1.0 : 0.0,
            child: Text(
              l10n.favorites,
              style: GoogleFonts.almarai(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          );
        },
      ),
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [StretchMode.zoomBackground, StretchMode.blurBackground],
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Background Gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary,
                    Color(0xFF005C2B), // Darker Saudi Green
                  ],
                ),
              ),
            ),
            // Content
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    l10n.favorites,
                    style: GoogleFonts.almarai(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 40,
                    height: 3,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(child: _buildSearchBar(isArabic)),
                        const SizedBox(width: 12),
                        _buildSortButton(isArabic),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bottom Rounded Curve
            Positioned(
              bottom: -1,
              left: 0,
              right: 0,
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(bool isArabic) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) => setState(() => searchQuery = value),
        textAlignVertical: TextAlignVertical.center,
        style: GoogleFonts.almarai(fontSize: 14),
        decoration: InputDecoration(
          hintText: isArabic ? 'ابحث في وجهاتك المفضلة...' : 'Search your favorites...',
          hintStyle: GoogleFonts.almarai(fontSize: 13, color: Colors.grey[400]),
          prefixIcon: const Icon(Icons.search_rounded, color: AppColors.primary, size: 22),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildSortButton(bool isArabic) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: PopupMenuButton<SortOption>(
        icon: const Icon(Icons.tune_rounded, color: Colors.white),
        onSelected: (option) => setState(() => currentSort = option),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: SortOption.name,
            child: Row(
              children: [
                const Icon(Icons.sort_by_alpha, size: 18),
                const SizedBox(width: 10),
                Text(isArabic ? 'أبجدياً' : 'Alphabetical', style: GoogleFonts.almarai(fontSize: 13)),
              ],
            ),
          ),
          PopupMenuItem(
            value: SortOption.priceLow,
            child: Row(
              children: [
                const Icon(Icons.trending_up, size: 18),
                const SizedBox(width: 10),
                Text(isArabic ? 'السعر: الأقل' : 'Price: Low', style: GoogleFonts.almarai(fontSize: 13)),
              ],
            ),
          ),
          PopupMenuItem(
            value: SortOption.priceHigh,
            child: Row(
              children: [
                const Icon(Icons.trending_down, size: 18),
                const SizedBox(width: 10),
                Text(isArabic ? 'السعر: الأعلى' : 'Price: High', style: GoogleFonts.almarai(fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(List<String> purposes, bool isArabic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _buildPriceTab(1, isArabic ? 'اقتصادي' : 'Budget'),
              const SizedBox(width: 8),
              _buildPriceTab(2, isArabic ? 'متوسط' : 'Moderate'),
              const SizedBox(width: 8),
              _buildPriceTab(3, isArabic ? 'فاخر' : 'Luxury'),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: purposes.length + 1,
            itemBuilder: (context, index) {
              final label = index == 0 ? (isArabic ? 'الكل' : 'All') : purposes[index - 1];
              final isSelected = (index == 0 && selectedPurpose == null) || (selectedPurpose == label);
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.only(right: 10),
                child: ChoiceChip(
                  label: Text(label, style: GoogleFonts.almarai(fontSize: 12)),
                  selected: isSelected,
                  onSelected: (val) => setState(() => selectedPurpose = (index == 0) ? null : label),
                  selectedColor: AppColors.primary,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  backgroundColor: Colors.white,
                  elevation: isSelected ? 4 : 0,
                  shadowColor: AppColors.primary.withOpacity(0.4),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: isSelected ? Colors.transparent : Colors.grey[200]!),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPriceTab(int category, String label) {
    final isSelected = selectedPriceCategory == category;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedPriceCategory = isSelected ? null : category),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.secondary : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: isSelected ? AppColors.secondary : Colors.grey[200]!),
            boxShadow: isSelected ? [
              BoxShadow(
                color: AppColors.secondary.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              )
            ] : [],
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.almarai(
                fontSize: 11,
                color: isSelected ? Colors.white : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFavoritesGrid(List<Attraction> list) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildFavoriteCard(context, list[index]),
          childCount: list.length,
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, Attraction attraction) {
    return GestureDetector(
      onTap: () {
        final l10n = AppLocalizations.of(context)!;
        final isArabic = Localizations.localeOf(context).languageCode == 'ar';
        final cities = AppConstants.getCities(l10n, isArabic);

        // Check if this attraction is actually a city
        final cityData = cities.cast<Map<String, dynamic>?>().firstWhere(
          (c) => c?['id'] == attraction.id,
          orElse: () => null,
        );

        if (cityData != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CityDetailsPage(city: cityData)),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AttractionDetailsPage(attraction: attraction)),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            children: [
              Positioned.fill(
                child: Hero(
                  tag: 'att_img_${attraction.id}',
                  child: Image.network(attraction.imageUrl, fit: BoxFit.cover),
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.9),
                      ],
                      stops: const [0.5, 0.7, 1.0],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.bookmark_rounded, color: AppColors.secondary, size: 20),
                    onPressed: () => context.read<HomeCubit>().toggleFavorite(attraction),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 15,
                right: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      attraction.name,
                      style: GoogleFonts.almarai(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(Icons.location_on_rounded, color: AppColors.secondary, size: 12),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            attraction.location,
                            style: GoogleFonts.almarai(color: Colors.white70, fontSize: 10),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoResultsState(bool isArabic) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.grey[100], shape: BoxShape.circle),
            child: Icon(Icons.search_off_rounded, size: 50, color: Colors.grey[400]),
          ),
          const SizedBox(height: 16),
          Text(
            isArabic ? 'لم نجد ما تبحث عنه' : 'No results found',
            style: GoogleFonts.almarai(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => setState(() {
              selectedPurpose = null;
              selectedPriceCategory = null;
              searchQuery = '';
            }),
            child: Text(isArabic ? 'تصفير الفلاتر' : 'Reset Filters', style: const TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, bool isArabic) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.bookmark_border_rounded, size: 100, color: AppColors.primary.withOpacity(0.1)),
        const SizedBox(height: 20),
        Text(
          isArabic ? 'لم تحفظ أي وجهة بعد' : 'No favorites yet',
          style: GoogleFonts.almarai(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        ),
        const SizedBox(height: 12),
        Text(
          isArabic ? 'ابدأ باستكشاف أجمل المناطق بالمملكة' : 'Start exploring the beauty of Saudi Arabia',
          style: GoogleFonts.almarai(color: AppColors.textSecondary),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            context.read<HomeCubit>().updateIndex(1);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 8,
            shadowColor: AppColors.primary.withOpacity(0.4),
          ),
          child: Text(isArabic ? 'اكتشف الآن' : 'Explore Now', style: GoogleFonts.almarai(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
