import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/core/widgets/custom_text_field.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_state.dart';
import 'package:graduation_project/features/auth/presentation/pages/login_page.dart';
import 'package:graduation_project/main.dart';

import '../../../../l10n/app_localizations.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _selectedTravelerType;
  String? _selectedTravelPurpose;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onRegister(AppLocalizations l10n) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().register(
            _fullNameController.text.trim(),
            _emailController.text.trim(),
            _passwordController.text.trim(),
            _selectedTravelerType!,
            _selectedTravelPurpose!,
          );
    }
  }

  void _showSuccessDialog(AppLocalizations l10n) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundColor: Color(0xFFE8F5E9),
                  child: Icon(Icons.check_circle, color: AppColors.primary, size: 48),
                ),
                const SizedBox(height: 24),
                Text(
                  l10n.registerSuccess,
                  style: GoogleFonts.almarai(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.registerSuccessDesc,
                  style: GoogleFonts.almarai(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: Text(
                      l10n.login,
                      style: GoogleFonts.almarai(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    bool isArabic = l10n.localeName == 'ar';

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message, style: GoogleFonts.almarai()),
                backgroundColor: AppColors.error,
                behavior: SnackBarBehavior.floating,
              ),
            );
          } else if (state is AuthRegistrationSuccess) {
            _showSuccessDialog(l10n);
          }
        },
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  SaudiTravelApp.setLocale(
                                    context,
                                    isArabic ? const Locale('en') : const Locale('ar'),
                                  );
                                },
                                icon: const Icon(Icons.language, color: Colors.white),
                                label: Text(
                                  isArabic ? 'English' : 'العربية',
                                  style: GoogleFonts.almarai(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white24,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Center(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.airplanemode_active, size: 50, color: AppColors.primary),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  l10n.register,
                                  style: GoogleFonts.almarai(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 32),
                                CustomTextField(
                                  controller: _fullNameController,
                                  label: l10n.fullName,
                                  prefixIcon: const Icon(Icons.person_outline, color: AppColors.primary),
                                  validator: (value) => value!.isEmpty ? l10n.enterFullName : null,
                                ),
                                const SizedBox(height: 16),
                                CustomTextField(
                                  controller: _emailController,
                                  label: l10n.email,
                                  keyboardType: TextInputType.emailAddress,
                                  prefixIcon: const Icon(Icons.email_outlined, color: AppColors.primary),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) return l10n.enterEmail;
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                CustomTextField(
                                  controller: _passwordController,
                                  label: l10n.password,
                                  isPassword: !_isPasswordVisible,
                                  prefixIcon: const Icon(Icons.lock_outline, color: AppColors.primary),
                                  suffixIcon: IconButton(
                                    icon: Icon(_isPasswordVisible ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                                  ),
                                  validator: (value) => value!.length < 6 ? l10n.passwordTooShort : null,
                                ),
                                const SizedBox(height: 16),
                                CustomTextField(
                                  controller: _confirmPasswordController,
                                  label: l10n.confirmPassword,
                                  isPassword: !_isConfirmPasswordVisible,
                                  prefixIcon: const Icon(Icons.lock_clock_outlined, color: AppColors.primary),
                                  suffixIcon: IconButton(
                                    icon: Icon(_isConfirmPasswordVisible ? Icons.visibility_off : Icons.visibility),
                                    onPressed: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) return l10n.enterPassword;
                                    if (value != _passwordController.text) return l10n.passwordsDoNotMatch;
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                DropdownButtonFormField<String>(
                                  value: _selectedTravelerType,
                                  decoration: InputDecoration(
                                    labelText: l10n.travelerType,
                                    prefixIcon: const Icon(Icons.account_balance_wallet_outlined, color: AppColors.primary),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                  items: [
                                    DropdownMenuItem(value: l10n.economic, child: Text(l10n.economic, style: GoogleFonts.almarai(fontSize: 14))),
                                    DropdownMenuItem(value: l10n.moderate, child: Text(l10n.moderate, style: GoogleFonts.almarai(fontSize: 14))),
                                    DropdownMenuItem(value: l10n.luxury, child: Text(l10n.luxury, style: GoogleFonts.almarai(fontSize: 14))),
                                  ],
                                  onChanged: (val) => setState(() => _selectedTravelerType = val),
                                  validator: (val) => val == null ? l10n.selectTravelerType : null,
                                ),
                                const SizedBox(height: 16),
                                DropdownButtonFormField<String>(
                                  value: _selectedTravelPurpose,
                                  decoration: InputDecoration(
                                    labelText: l10n.travelPurpose,
                                    prefixIcon: const Icon(Icons.explore_outlined, color: AppColors.primary),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                  items: [
                                    DropdownMenuItem(value: l10n.adventure, child: Text(l10n.adventure, style: GoogleFonts.almarai(fontSize: 14))),
                                    DropdownMenuItem(value: l10n.family, child: Text(l10n.family, style: GoogleFonts.almarai(fontSize: 14))),
                                    DropdownMenuItem(value: l10n.religious, child: Text(l10n.religious, style: GoogleFonts.almarai(fontSize: 14))),
                                    DropdownMenuItem(value: l10n.business, child: Text(l10n.business, style: GoogleFonts.almarai(fontSize: 14))),
                                  ],
                                  onChanged: (val) => setState(() => _selectedTravelPurpose = val),
                                  validator: (val) => val == null ? l10n.selectTravelPurpose : null,
                                ),
                                const SizedBox(height: 32),
                                BlocBuilder<AuthCubit, AuthState>(
                                  builder: (context, state) {
                                    final isLoading = state is AuthLoading;
                                    return ElevatedButton(
                                      onPressed: isLoading ? null : () => _onRegister(l10n),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primary,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                      ),
                                      child: isLoading
                                          ? const SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 2,
                                              ),
                                            )
                                          : Text(
                                              l10n.register,
                                              style: GoogleFonts.almarai(fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(l10n.haveAccount),
                                    TextButton(
                                      onPressed: () => Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (_) => const LoginPage()),
                                      ),
                                      child: Text(l10n.login,
                                          style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
