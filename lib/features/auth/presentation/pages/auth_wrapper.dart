import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:graduation_project/features/auth/presentation/cubit/auth_state.dart';
import 'package:graduation_project/features/auth/presentation/pages/login_page.dart';
import 'package:graduation_project/features/home/presentation/cubit/home_cubit.dart';
import 'package:graduation_project/features/home/presentation/pages/home_page.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthCubit>().state;
    if (authState is Authenticated) {
      context.read<HomeCubit>().loadUserTrips(authState.user.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.read<HomeCubit>().loadUserTrips(state.user.id);
        } else if (state is Unauthenticated) {
          context.read<HomeCubit>().clearTrips();
        }
      },
      buildWhen: (previous, current) {
        return current is! AuthLoading && current is! AuthRegistrationSuccess && current is! AuthError;
      },
      builder: (context, state) {
        if (state is Authenticated || state is AuthenticatedGuest) {
          return const HomePage();
        }
        // جعل صفحة تسجيل الدخول هي الصفحة الافتراضية عند عدم تسجيل الدخول
        return const LoginPage();
      },
    );
  }
}
