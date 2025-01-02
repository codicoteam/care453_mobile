
import 'dart:async';

import 'package:care453/core/helpers/genenal_helpers.dart';
import 'package:care453/features/Home/admin_main_home.dart';
import 'package:care453/features/Home/client_main_screen.dart';
import 'package:care453/features/auth/Screens/account_verfication.dart';
import 'package:care453/features/splash/role_selection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/select_user_enum.dart';
import '../Handler/auth_handler.dart';
import '../Screens/confirm_email.dart';

class AuthHelpers {
  static Future<void> handleEmailVerification(BuildContext context, User user) async {
    if (!user.emailVerified) {
      GeneralHelpers.permanentNavigator(context, EmailVerificationScreen(user: user));
    } else {
      GeneralHelpers.permanentNavigator(context, const AuthHandler());
    }
  }
    static Future<void> checkEmailVerification({required BuildContext context, required User currentUser}) async {
    await currentUser.reload().then((value){
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        GeneralHelpers.permanentNavigator(context, const AuthHandler());
      }
    });

  }
  
  static setTimerForAutoRedirect(BuildContext context) {
    const Duration timerPeriod = Duration(seconds: 5); // Change the timer period as needed
    Timer.periodic(
      timerPeriod,
          (timer) async {
        await FirebaseAuth.instance.currentUser?.reload().then((value){
          final user = FirebaseAuth.instance.currentUser;

          if (user?.emailVerified ?? false) {

            timer.cancel(); // Stop the timer once verification is successful

            GeneralHelpers.permanentNavigator(
                context,
                const AccountVerificationSuccessful()
            );
          }
        });

      },
    );
  }

  static Future<String?> getCurrentUserToken() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String? token = await user.getIdToken();
        return token;
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting user token: $e');
      return null;
    }
  }



  static Widget getSelectedUserRole() {
    switch (userRole) {
      case UserRole.careProfessioner:
        return const EmployeeMainScreen();
      case UserRole.client:
        return const ClientMainScreen();
      default:
        return const InitialRoleSelectionScreen();
    }
  }


}