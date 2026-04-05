import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/core/utils/app_constants.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_state.dart';
import 'package:graduation_project/features/home/data/models/trip_model.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_cubit.dart';

import '../../../../l10n/app_localizations.dart';

class CreateTripBottomSheet extends StatefulWidget {
  final String? initialCity;
  const CreateTripBottomSheet({super.key, this.initialCity});

  @override
  State<CreateTripBottomSheet> createState() => _CreateTripBottomSheetState();
}

class _CreateTripBottomSheetState extends State<CreateTripBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  String? _selectedCity;
  String? _selectedPurpose;
  String? _selectedBudgetLevel;

  @override
  void initState() {
    super.initState();
    _selectedCity = widget.initialCity;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    bool isArabic = l10n.localeName == 'ar';

    final List<String> cities = AppConstants.getCities(l10n, isArabic)
        .map((city) => city['name'] as String)
        .toList();

    final List<String> purposes = [
      l10n.adventure,
      l10n.family,
      l10n.religious,
      l10n.business,
    ];

    final List<String> budgetLevels = [
      l10n.economic,
      l10n.moderate,
      l10n.luxury,
    ];

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        top: 20,
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.createTrip,
                  style: GoogleFonts.almarai(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.primary.withOpacity(0.1)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline_rounded, color: AppColors.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      l10n.createTripDesc,
                      style: GoogleFonts.almarai(fontSize: 12, color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildField(l10n.tripName, Icons.flag_rounded, l10n.tripNameHint, _nameController),
            _buildDateField(l10n.startDate, Icons.calendar_today_rounded, _startDateController),
            _buildDateField(l10n.endDate, Icons.calendar_month_rounded, _endDateController),
            _buildDropdownField(
              l10n.city,
              Icons.location_city_rounded,
              cities,
              l10n.selectCity,
              _selectedCity,
              (val) => setState(() => _selectedCity = val),
            ),
            _buildDropdownField(
              l10n.travelPurpose,
              Icons.explore_rounded,
              purposes,
              l10n.selectTravelPurpose,
              _selectedPurpose,
              (val) => setState(() => _selectedPurpose = val),
            ),
            _buildDropdownField(
              l10n.travelerType,
              Icons.payments_rounded,
              budgetLevels,
              l10n.selectTravelerType,
              _selectedBudgetLevel,
              (val) => setState(() => _selectedBudgetLevel = val),
            ),
            _buildField(l10n.estimatedBudget, Icons.account_balance_wallet_rounded, l10n.budgetHint, _budgetController, keyboardType: TextInputType.number),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final authState = context.read<AuthCubit>().state;
                  String? userId;
                  if (authState is Authenticated) {
                    userId = authState.user.id;
                  }

                  if (_nameController.text.isNotEmpty &&
                      _startDateController.text.isNotEmpty &&
                      _endDateController.text.isNotEmpty &&
                      _budgetController.text.isNotEmpty &&
                      _selectedCity != null &&
                      _selectedPurpose != null &&
                      _selectedBudgetLevel != null &&
                      userId != null) {

                    final newTrip = Trip(
                      id: '', // Will be generated by Firestore add()
                      userId: userId,
                      name: _nameController.text,
                      city: _selectedCity!,
                      startDate: _startDateController.text,
                      endDate: _endDateController.text,
                      budget: double.tryParse(_budgetController.text) ?? 0.0,
                      travelPurpose: _selectedPurpose,
                      travelerType: _selectedBudgetLevel,
                    );

                    context.read<HomeCubit>().createTrip(newTrip);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.tripCreatedSuccess)),
                    );
                  } else if (userId == null) {
                     ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(isArabic ? 'يجب تسجيل الدخول لحفظ الرحلة' : 'Must be logged in to save trip'),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(l10n.fillAllFields),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  elevation: 0,
                ),
                child: Text(
                  l10n.createTrip,
                  style: GoogleFonts.almarai(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, IconData icon, String hint, TextEditingController controller, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.almarai(color: AppColors.textSecondary, fontSize: 14),
          hintText: hint,
          prefixIcon: Icon(icon, color: AppColors.primary),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget _buildDateField(String label, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            setState(() {
              controller.text = "${pickedDate.day} / ${pickedDate.month} / ${pickedDate.year}";
            });
          }
        },
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.almarai(color: AppColors.textSecondary, fontSize: 14),
          prefixIcon: Icon(icon, color: AppColors.primary),
          suffixIcon: const Icon(Icons.calendar_today),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget _buildDropdownField(
    String label,
    IconData icon,
    List<String> items,
    String hint,
    String? value,
    void Function(String?) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.almarai(color: AppColors.textSecondary, fontSize: 14),
          prefixIcon: Icon(icon, color: AppColors.primary),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isDense: true,
            value: value,
            hint: Text(hint, style: GoogleFonts.almarai(fontSize: 14)),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: GoogleFonts.almarai()),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
