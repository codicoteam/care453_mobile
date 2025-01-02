import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
      background: const Color.fromARGB(255, 20, 20, 20),
      primary: const Color.fromARGB(255, 105, 105, 105),
      secondary: const Color.fromARGB(255, 30, 30, 30),
      tertiary: const Color.fromARGB(255, 47, 47, 47),
      inversePrimary: Colors.grey.shade300,
    ),
  );

  static ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
      background: Colors.white,
      primary: Colors.grey.shade500,
      secondary: Colors.grey.shade200,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade900,
    ),
  );
}