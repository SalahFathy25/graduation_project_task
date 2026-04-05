import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/core/theme/app_colors.dart';
import 'package:graduation_project/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:graduation_project/features/auth/domain/repositories/auth_repository.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/pages/auth_wrapper.dart';
import 'package:graduation_project/features/home/data/repositories/trip_repository_impl.dart';
import 'package:graduation_project/features/home/domain/repositories/trip_repository.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_cubit.dart';

import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Firebase initialization error: $e');
  }

  runApp(const SaudiTravelApp());
}

class SaudiTravelApp extends StatefulWidget {
  const SaudiTravelApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _SaudiTravelAppState? state = context.findAncestorStateOfType<_SaudiTravelAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<SaudiTravelApp> createState() => _SaudiTravelAppState();
}

class _SaudiTravelAppState extends State<SaudiTravelApp> {
  Locale _locale = const Locale('ar');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(),
        ),
        RepositoryProvider<TripRepository>(
          create: (context) => TripRepositoryImpl(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) => HomeCubit(context.read<TripRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Saudi Travel Planner',
          debugShowCheckedModeBanner: false,
          locale: _locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              primary: AppColors.primary,
              secondary: AppColors.secondary,
              error: AppColors.error,
              surface: AppColors.surface,
            ),
            textTheme: GoogleFonts.almaraiTextTheme(),
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              elevation: 0,
            ),
          ),
          home: const AuthWrapper(),
        ),
      ),
    );
  }
}
