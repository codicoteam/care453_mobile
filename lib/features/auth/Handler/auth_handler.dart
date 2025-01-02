import 'package:care453/features/Home/admin_main_home.dart';
import 'package:care453/features/Home/client_main_screen.dart';
import 'package:care453/features/auth/Helpers/auth_helpers.dart';
import 'package:care453/features/auth/Screens/sign_in.dart';
import 'package:care453/features/splash/role_selection.dart';
import 'package:care453/features/welcome/employee_introduction_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/casched_data.dart';
import '../../../models/select_user_enum.dart';
import '../../welcome/client_introduction_screen.dart';

class AuthHandler extends StatelessWidget {
  const AuthHandler({Key? key}) : super(key: key);

  Future<User?> _getCurrentUser() async {
    try {
      return FirebaseAuth.instance.currentUser;
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserRole?>(
      future: CacheUtils.checkUserRole(),
      builder: (context, roleSnapshot) {
        if (roleSnapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final userRole = roleSnapshot.data;

        if (userRole == null) {
          return const InitialRoleSelectionScreen();
        }

        return FutureBuilder<bool>(
          future: CacheUtils.checkOnBoardingStatus(),
          builder: (context, onboardingSnapshot) {
            if (onboardingSnapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            final hasSeenOnboarding = onboardingSnapshot.data ?? false;

            return FutureBuilder<User?>(
              future: _getCurrentUser(),
              builder: (context, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    body: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (userSnapshot.hasData) {
                  final user = userSnapshot.data!;
                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                    if (!user.emailVerified) {
                      AuthHelpers.handleEmailVerification(context, user);
                    }
                  });
                  return userRole == UserRole.client
                      ? const ClientMainScreen()
                      : const EmployeeMainScreen();
                } else {
                  return hasSeenOnboarding
                      ? const Login()
                      : userRole == UserRole.careProfessioner
                          ? const EmployeeIntroductionScreen()
                          : const ClientIntroductionScreen();
                }
              },
            );
          },
        );
      },
    );
  }
}
