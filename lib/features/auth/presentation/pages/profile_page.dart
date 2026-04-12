import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/core/utils/notification_service.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_state.dart';
import 'package:graduation_project/features/auth/presentation/pages/auth_wrapper.dart';
import 'package:graduation_project/main.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const AuthWrapper()),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        String name = isArabic ? "مستخدم" : "User";
        String email = "";
        String type = isArabic ? "متوسط" : "Moderate";
        String purpose = isArabic ? "عائلة" : "Family";

        if (state is Authenticated) {
          name = state.user.fullName;
          email = state.user.email;
          type = state.user.travelerType;
          purpose = state.user.travelPurpose;
        } else if (state is AuthLoading && state.currentUser != null) {
          name = state.currentUser!.fullName;
          email = state.currentUser!.email;
          type = state.currentUser!.travelerType;
          purpose = state.currentUser!.travelPurpose;
        } else if (state is AuthenticatedGuest) {
          name = isArabic ? "ضيف" : "Guest";
          email = isArabic ? "وضع الضيف" : "Guest Mode";
        }

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            elevation: 0,
            title: Text(
              isArabic ? 'حسابي' : 'My Profile',
              style: GoogleFonts.almarai(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  SaudiTravelApp.setLocale(
                    context,
                    isArabic ? const Locale('en') : const Locale('ar'),
                  );
                },
                child: Text(
                  isArabic ? 'English' : 'العربية',
                  style: GoogleFonts.almarai(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // 1. Profile Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.background,
                          child: Icon(Icons.person, size: 60, color: AppColors.primary),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 48), // To balance the icon on the right
                          Text(
                            name,
                            style: GoogleFonts.almarai(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (state is Authenticated)
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.white70, size: 20),
                              onPressed: () => _showUpdateNameDialog(context, name, isArabic),
                            )
                          else
                            const SizedBox(width: 48),
                        ],
                      ),
                      if (email.isNotEmpty)
                        Text(
                          email,
                          style: GoogleFonts.almarai(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // 2. Info Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _buildProfileItem(Icons.account_balance_wallet_outlined, isArabic ? 'فئة الميزانية' : 'Budget Class', type),
                      _buildProfileItem(Icons.explore_outlined, isArabic ? 'سبب السفر' : 'Travel Purpose', purpose),
                      _buildProfileItem(Icons.language_rounded, isArabic ? 'اللغة' : 'Language', isArabic ? 'العربية' : 'English'),

                      const SizedBox(height: 32),

                      // 3. Logout Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            context.read<AuthCubit>().logout();
                            NotificationService.showNotification(
                              id: 1,
                              title: isArabic ? 'تسجيل الخروج' : 'Logout',
                              body: isArabic ? 'نراك قريباً في السعودية!' : 'See you soon in Saudi Arabia!',
                            );
                          },
                          icon: const Icon(Icons.logout_rounded),
                          label: Text(
                            isArabic ? 'تسجيل الخروج' : 'Logout',
                            style: GoogleFonts.almarai(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red[50],
                            foregroundColor: Colors.red,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: Colors.red[100]!),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showUpdateNameDialog(BuildContext context, String currentName, bool isArabic) {
    final controller = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          isArabic ? 'تعديل الاسم' : 'Edit Name',
          style: GoogleFonts.almarai(fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: isArabic ? 'أدخل الاسم الجديد' : 'Enter new name',
          ),
          style: GoogleFonts.almarai(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              isArabic ? 'إلغاء' : 'Cancel',
              style: GoogleFonts.almarai(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                context.read<AuthCubit>().updateName(controller.text.trim());
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: Text(
              isArabic ? 'حفظ' : 'Save',
              style: GoogleFonts.almarai(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(width: 16),
          Text(
            label,
            style: GoogleFonts.almarai(fontSize: 14, color: AppColors.textSecondary),
          ),
          const Spacer(),
          Text(
            value,
            style: GoogleFonts.almarai(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
