import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color brandTeal = Color(0xFF365F67);
  static const Color brandTealLight = Color(0xFF407079);
  static const Color brandGray = Color(0xFFE3E3E3);
  static const Color white = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color textColor = Color(0xFF365F67);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.brandTeal,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.brandTeal,
        elevation: 4,
        shadowColor: Colors.black26,
        centerTitle: false,
        titleTextStyle: GoogleFonts.daysOne(
          color: AppColors.white,
          fontSize: 45,
          fontWeight: FontWeight.w400,
          shadows: [
            const Shadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.daysOne(
          color: AppColors.brandTeal,
          fontSize: 45,
          fontWeight: FontWeight.w400,
          shadows: [
            const Shadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        headlineMedium: GoogleFonts.nunitoSans(
          color: AppColors.textColor,
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
        bodyMedium: GoogleFonts.nunitoSans(
          color: AppColors.textColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: GoogleFonts.nunitoSans(
          color: AppColors.textColor,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brandTeal,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          textStyle: GoogleFonts.nunitoSans(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: 24,
      ),
    );
  }
}
