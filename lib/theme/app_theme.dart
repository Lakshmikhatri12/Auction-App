import 'package:cloth_store/theme/custom_Theme/elevated_button_theme.dart';
import 'package:cloth_store/theme/custom_Theme/text_theme.dart';
import 'package:cloth_store/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  /// ---------------- LIGHT THEME ----------------
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,

    colorScheme: const ColorScheme(
      brightness: Brightness.light,

      primary: AppColors.primaryColor,
      onPrimary: Colors.white,

      secondary: AppColors.primaryColor,
      onSecondary: Colors.white,

      surface: AppColors.textprimary,
      onSurface: AppColors.textwhite,

      background: AppColors.lightbackgroundColor,
      onBackground: AppColors.textprimary,

      error: AppColors.error,
      onError: Colors.white,
    ),

    scaffoldBackgroundColor: AppColors.lightbackgroundColor,
    textTheme: AppTextTheme.lightTextTheme,

    elevatedButtonTheme: AppElevatedButtonTheme.elevatedButton,

    iconTheme: const IconThemeData(color: AppColors.textprimary, size: 26),

    dividerColor: AppColors.textSecondary.withOpacity(0.2),
  );

  /// ---------------- DARK THEME ----------------
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,

    colorScheme: const ColorScheme(
      brightness: Brightness.dark,

      primary: AppColors.primaryColor,
      onPrimary: Colors.white,

      secondary: AppColors.primaryColor,
      onSecondary: Colors.white,

      surface: AppColors.textwhite,
      onSurface: AppColors.buttonColor,

      background: AppColors.DarkbackgroundColor,
      onBackground: AppColors.textwhite,

      error: AppColors.error,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: AppColors.DarkbackgroundColor,
    textTheme: AppTextTheme.darkTextTheme,

    elevatedButtonTheme: AppElevatedButtonTheme.elevatedButton,

    iconTheme: const IconThemeData(color: AppColors.textwhite, size: 26),

    dividerColor: AppColors.textwhite.withOpacity(0.15),
  );
}
