import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF365F67); // Teal
  static const Color primaryLight = Color(0xFF407079); // Lighter teal
  static const Color background = Colors.white;
  static const Color cardBackground = Color(0xFFF0EFEF);
  static const Color textPrimary = Color(0xFF365F67);
  static const Color textSecondary = Color(0xFF5D6478);
  static const Color error = Color(0xFFFF0000); // Red for Cancel
  static const Color success = Color(0xFF009E05); // Green for Confirm
  static const Color border = Color(0xFFDDD);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromRGBO(54, 95, 103, 1),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        elevation: 8,
        centerTitle: false,
        titleTextStyle: GoogleFonts.daysOne(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.daysOne(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          color: AppColors.textPrimary,
        ),
        headlineSmall: GoogleFonts.nunitoSans(
          fontSize: 17.5,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        bodyMedium: GoogleFonts.nunitoSans(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        bodySmall: GoogleFonts.nunitoSans(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
        ),
      ),
    );
  }
}
