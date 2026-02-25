import 'package:cloth_store/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: GoogleFonts.archivo(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1.25,
      letterSpacing: -0.4,
      color: AppColors.textprimary,
    ),
    headlineMedium: GoogleFonts.archivo(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      height: 1.3,
      letterSpacing: -0.3,
      color: AppColors.textprimary,
    ),
    headlineSmall: GoogleFonts.archivo(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.35,
      letterSpacing: -0.2,
      color: AppColors.textprimary,
    ),
    titleLarge: GoogleFonts.archivo(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      height: 1.4,
      letterSpacing: -0.2,
      color: AppColors.textprimary,
    ),
    titleMedium: GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.5,
      letterSpacing: 0.15,
      color: AppColors.textSecondary,
    ),
    titleSmall: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.6,
      letterSpacing: 0.25,
      color: AppColors.textSecondary,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: GoogleFonts.archivo(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      height: 1.25,
      letterSpacing: -0.4,
      color: AppColors.textwhite,
    ),
    headlineMedium: GoogleFonts.archivo(
      fontSize: 20,
      fontWeight: FontWeight.w800,
      height: 1.3,
      letterSpacing: -0.3,
      color: AppColors.textwhite,
    ),
    headlineSmall: GoogleFonts.archivo(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.35,
      letterSpacing: -0.2,
      color: AppColors.textwhite,
    ),
    titleLarge: GoogleFonts.archivo(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      height: 1.4,
      letterSpacing: -0.2,
      color: AppColors.textwhite,
    ),
    titleMedium: GoogleFonts.lato(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      height: 1.5,
      letterSpacing: 0.15,
      color: AppColors.textwhite,
    ),
    titleSmall: GoogleFonts.lato(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.6,
      letterSpacing: 0.25,
      color: AppColors.textwhite,
    ),
  );
}
