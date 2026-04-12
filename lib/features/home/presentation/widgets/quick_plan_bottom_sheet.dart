import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_state.dart';
import 'package:graduation_project/features/home/data/models/trip_model.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_cubit.dart';
import 'package:intl/intl.dart';
import '../../../../l10n/app_localizations.dart';
import '../pages/my_trips_page.dart';

class QuickPlanBottomSheet extends StatefulWidget {
  final String cityName;
  final List<String> availableActivities;

  const QuickPlanBottomSheet({
    super.key,
    required this.cityName,
    required this.availableActivities
  });

  @override
  State<QuickPlanBottomSheet> createState() => _QuickPlanBottomSheetState();
}

class _QuickPlanBottomSheetState extends State<QuickPlanBottomSheet> {
  int _currentStep = 0;
  final List<String> _selectedActivities = [];
  double _budget = 1000;
  int _duration = 3;
  bool _isGenerating = false;

  // منطق حساب الميزانية المقترحة
  double _calculateSuggestedBudget() {
    double baseDailyCost = 300; // تكلفة أساسية يومية (سكن وأكل)

    // تعديل التكلفة بناءً على المدينة
    final cityLower = widget.cityName.toLowerCase();
    if (cityLower.contains('riyadh') || cityLower.contains('الرياض')) {
      baseDailyCost = 500;
    } else if (cityLower.contains('jeddah') || cityLower.contains('جدة')) {
      baseDailyCost = 450;
    } else if (cityLower.contains('neom') || cityLower.contains('نيوم')) {
      baseDailyCost = 800;
    }

    // تكلفة الأنشطة (افتراضياً 150 ريال لكل نشاط مختار)
    double activitiesCost = _selectedActivities.length * 150.0;

    return (baseDailyCost * _duration) + activitiesCost;
  }

  @override
  void initState() {
    super.initState();
    // تعيين ميزانية ابتدائية
    _budget = _calculateSuggestedBudget();
  }

  void _nextStep() {
    if (_currentStep < 2) {
      if (_currentStep == 0 || _currentStep == 2) {
        // تحديث الميزانية المقترحة عند الانتقال من الخطوة 1 (الأنشطة) أو الخطوة 3 (المدة)
        setState(() {
          _budget = _calculateSuggestedBudget();
        });
      }
      setState(() => _currentStep++);
    } else {
      _generateTrip();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isArabic = l10n.localeName == 'ar';

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        top: 24, left: 24, right: 24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(l10n),
          const SizedBox(height: 20),
          _buildStepIndicator(),
          const SizedBox(height: 24),
          IndexedStack(
            index: _currentStep,
            children: [
              _buildActivitiesStep(isArabic),
              _buildBudgetStep(isArabic),
              _buildDurationStep(l10n),
            ],
          ),
          const SizedBox(height: 32),
          _buildActionButton(l10n),
        ],
      ),
    );
  }

  Widget _buildHeader(AppLocalizations l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _currentStep == 0 ? (l10n.localeName == 'ar' ? 'اختر الأنشطة' : 'Select Activities') :
          _currentStep == 1 ? (l10n.localeName == 'ar' ? 'الميزانية المقترحة' : 'Suggested Budget') :
          (l10n.localeName == 'ar' ? 'مدة الرحلة' : 'Set Duration'),
          style: GoogleFonts.almarai(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
        IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close_rounded)),
      ],
    );
  }

  Widget _buildStepIndicator() {
    return Row(
      children: List.generate(3, (index) => Expanded(
        child: Container(
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index <= _currentStep ? AppColors.primary : Colors.grey[200],
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      )),
    );
  }

  Widget _buildActivitiesStep(bool isArabic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isArabic ? 'اختر ما يهمك لزيادة دقة الحساب:' : 'Select what interests you for accuracy:',
          style: GoogleFonts.almarai(fontSize: 13, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 220,
          child: ListView.builder(
            itemCount: widget.availableActivities.length,
            itemBuilder: (context, index) {
              final activity = widget.availableActivities[index];
              final isSelected = _selectedActivities.contains(activity);
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary.withOpacity(0.05) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: isSelected ? AppColors.primary : Colors.grey[200]!),
                ),
                child: CheckboxListTile(
                  title: Text(activity, style: GoogleFonts.almarai(fontSize: 14)),
                  value: isSelected,
                  activeColor: AppColors.primary,
                  onChanged: (val) {
                    setState(() {
                      val! ? _selectedActivities.add(activity) : _selectedActivities.remove(activity);
                      _budget = _calculateSuggestedBudget(); // تحديث فوري للميزانية
                    });
                  },

                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBudgetStep(bool isArabic) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.account_balance_wallet_rounded, size: 40, color: AppColors.primary),
        ),
        const SizedBox(height: 16),
        Text(
          '${_budget.toInt()} ${isArabic ? 'ريال' : 'SAR'}',
          style: GoogleFonts.almarai(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
        const SizedBox(height: 8),
        Text(
          isArabic ? 'بناءً على اختيارك، هذه ميزانية تقريبية' : 'Based on your choices, this is an estimate',
          style: GoogleFonts.almarai(fontSize: 13, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        Slider(
          value: _budget,
          min: 500,
          max: 20000,
          divisions: 39,
          activeColor: AppColors.primary,
          onChanged: (val) => setState(() => _budget = val),
        ),
        Text(isArabic ? 'يمكنك التعديل يدوياً إذا أردت' : 'You can adjust manually if you wish',
            style: GoogleFonts.almarai(fontSize: 11, color: AppColors.secondary)),
      ],
    );
  }

  Widget _buildDurationStep(AppLocalizations l10n) {
    return Column(
      children: [
        const Icon(Icons.calendar_month_rounded, size: 50, color: AppColors.primary),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCircleBtn(Icons.remove, () {
              setState(() {
                _duration = _duration > 1 ? _duration - 1 : 1;
                _budget = _calculateSuggestedBudget();
              });
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text('$_duration ${l10n.days}', style: GoogleFonts.almarai(fontSize: 28, fontWeight: FontWeight.bold)),
            ),
            _buildCircleBtn(Icons.add, () {
              setState(() {
                _duration = _duration < 14 ? _duration + 1 : 14;
                _budget = _calculateSuggestedBudget();
              });
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildCircleBtn(IconData icon, VoidCallback onTap) {
    return IconButton.filled(
      onPressed: onTap,
      icon: Icon(icon),
      style: IconButton.styleFrom(
        backgroundColor: AppColors.primary.withOpacity(0.1),
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.all(12),
      ),
    );
  }

  Widget _buildActionButton(AppLocalizations l10n) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isGenerating ? null : _nextStep,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 0,
        ),
        child: _isGenerating
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
              _currentStep < 2 ? (l10n.localeName == 'ar' ? 'التالي' : 'Next') : l10n.generatePlan,
              style: GoogleFonts.almarai(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
            ),
      ),
    );
  }

  Future<void> _generateTrip() async {
    setState(() => _isGenerating = true);
    final authState = context.read<AuthCubit>().state;
    if (authState is! Authenticated) return;

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    final l10n = AppLocalizations.of(context)!;
    final isArabic = l10n.localeName == 'ar';

    final now = DateTime.now();
    final end = now.add(Duration(days: _duration));
    final dateFormat = DateFormat('d / M / yyyy');

    final newTrip = Trip(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: authState.user.id,
      name: isArabic ? '${l10n.trip} ${widget.cityName}' : '${widget.cityName} ${l10n.trip}',
      city: widget.cityName,
      startDate: dateFormat.format(now),
      endDate: dateFormat.format(end),
      budget: _budget,
      spent: 0,
      activities: _selectedActivities.map((a) => {
        'title': a,
        'day': 1,
        'startTime': '10:00',
        'endTime': '12:00',
        'notes': 'Planned activity'
      }).toList(),
    );

    if (mounted) {
      context.read<HomeCubit>().createTrip(newTrip);
      Navigator.pop(context); // إغلاق الـ Bottom Sheet فقط

      // إظهار رسالة تأكيد (Toast/SnackBar)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            l10n.localeName == 'ar' 
                ? 'تمت إضافة الرحلة إلى قائمة رحلاتك بنجاح! 🎉' 
                : 'Trip added to your list successfully! 🎉',
            style: GoogleFonts.almarai(),
          ),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      );
    }
  }
}
