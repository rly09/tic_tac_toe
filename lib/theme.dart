import 'package:flutter/material.dart';

class AppColors {
  // Light Mode
  static const Color lightBackground = Color(0xFFECE9E6);
  static const Color lightXColor = Color(0xFFFF6B6B);
  static const Color lightOColor = Color(0xFF5AC8FA);
  static const Color lightGridColor = Color(0xFFE0E0E0);
  static const Color lightWinHighlight = Color(0xFF00C853);
  static const Color lightTextColor = Color(0xFF212121);
  static const Color lightGlass = Color.fromRGBO(255, 255, 255, 0.15);

  // Dark Mode
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkXColor = Color(0xFFFF5252);
  static const Color darkOColor = Color(0xFF40C4FF);
  static const Color darkGridColor = Color(0xFF2C2C2C);
  static const Color darkWinHighlight = Color(0xFF00E676);
  static const Color darkTextColor = Color(0xFFEEEEEE);
  static const Color darkGlass = Color.fromRGBO(255, 255, 255, 0.1);
}

// Custom TextTheme
final TextTheme customTextTheme = const TextTheme(
  headlineLarge: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  ),
  bodyMedium: TextStyle(
    fontSize: 16,
  ),
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto', // change this to your Google Font if needed
  colorScheme: const ColorScheme.light(
    background: AppColors.lightBackground,
    primary: AppColors.lightXColor,
    secondary: AppColors.lightOColor,
    onBackground: AppColors.lightTextColor,
    onPrimary: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.lightBackground,
  textTheme: customTextTheme.apply(
    bodyColor: AppColors.lightTextColor,
    displayColor: AppColors.lightTextColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.lightXColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto', // change this to your Google Font if needed
  colorScheme: const ColorScheme.dark(
    background: AppColors.darkBackground,
    primary: AppColors.darkXColor,
    secondary: AppColors.darkOColor,
    onBackground: AppColors.darkTextColor,
    onPrimary: Colors.white,
  ),
  scaffoldBackgroundColor: AppColors.darkBackground,
  textTheme: customTextTheme.apply(
    bodyColor: AppColors.darkTextColor,
    displayColor: AppColors.darkTextColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.darkXColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  ),
);
