import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/features/attractions/domain/entities/attraction.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_cubit.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_state.dart';

class AttractionDetailsPage extends StatefulWidget {
  final Attraction attraction;

  const AttractionDetailsPage({super.key, required this.attraction});

  @override
  State<AttractionDetailsPage> createState() => _AttractionDetailsPageState();
}

class _AttractionDetailsPageState extends State<AttractionDetailsPage> {
  int _days = 1;
  int _persons = 1;

  double get _totalBudget => widget.attraction.estimatedBudgetPerDay * _days * _persons;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      final isFavorite = state.favorites.any((fav) => fav.id == widget.attraction.id);

      return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<HomeCubit>().toggleFavorite(widget.attraction);
                  },
                  icon: Icon(
                    isFavorite ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                    color: isFavorite ? Colors.orange : Colors.white,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  widget.attraction.name,
                  style: GoogleFonts.almarai(fontWeight: FontWeight.bold),
                ),
                background: Image.network(
                  widget.attraction.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Colors.orange),
                        const SizedBox(width: 8),
                        Text(
                          widget.attraction.location,
                          style: GoogleFonts.almarai(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'عن الوجهة',
                      style: GoogleFonts.almarai(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.attraction.description,
                      style: GoogleFonts.almarai(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.divider),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'تخطيط الميزانية 💰',
                            style: GoogleFonts.almarai(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildCounter(
                            label: 'عدد الأيام',
                            value: _days,
                            onIncrement: () => setState(() => _days++),
                            onDecrement: () => setState(() {
                              if (_days > 1) _days--;
                            }),
                          ),
                          const SizedBox(height: 16),
                          _buildCounter(
                            label: 'عدد الأشخاص',
                            value: _persons,
                            onIncrement: () => setState(() => _persons++),
                            onDecrement: () => setState(() {
                              if (_persons > 1) _persons--;
                            }),
                          ),
                          const Divider(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'الميزانية الإجمالية التقديرية:',
                                style: GoogleFonts.almarai(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '$_totalBudget ريال',
                                style: GoogleFonts.almarai(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildCounter({
    required String label,
    required int value,
    required VoidCallback onIncrement,
    required VoidCallback onDecrement,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.almarai(fontSize: 16),
        ),
        Row(
          children: [
            IconButton(
              onPressed: onDecrement,
              icon: const Icon(Icons.remove_circle_outline, color: AppColors.primary),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.divider),
              ),
              child: Text(
                '$value',
                style: GoogleFonts.almarai(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              onPressed: onIncrement,
              icon: const Icon(Icons.add_circle_outline, color: AppColors.primary),
            ),
          ],
        ),
      ],
    );
  }
}
