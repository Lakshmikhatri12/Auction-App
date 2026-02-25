import 'package:cloth_store/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final elevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      textStyle: GoogleFonts.lato(
        color: AppColors.textwhite,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        height: 1.2,
        letterSpacing: 0.5,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    ),
  );
}
