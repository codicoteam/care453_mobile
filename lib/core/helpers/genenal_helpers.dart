
import 'package:flutter/material.dart';


class GeneralHelpers {
  // Method to navigate to another screen with back function
  static void temporaryNavigator(BuildContext context, Widget nextScreen) {
    Navigator.push(context, MaterialPageRoute(builder: (c) => nextScreen));
  }

  // Method to navigate to another screen without back function
  static void permanentNavigator(BuildContext context, Widget nextScreen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (c) => nextScreen));
  }

  // Method to navigate to previous screen
  static void back(BuildContext context) {
    Navigator.pop(context);
  }


  static bool isEmail(String email) {
    if (email == null) {
      return false;
    }
    final pattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return pattern.hasMatch(email);
  }


  static bool isStrongPassword(String password) {
    if (password == null) {
      return false;
    }

    // Check for at least one uppercase letter
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(password);

    // Check for at least one lowercase letter
    final hasLowercase = RegExp(r'[a-z]').hasMatch(password);

    // Check for at least one number
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);

    // Check for at least one special character
    final hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);

    // Return true if all criteria are met
    return hasUppercase && hasLowercase && hasNumber && hasSpecialChar;
  }




  //
}

