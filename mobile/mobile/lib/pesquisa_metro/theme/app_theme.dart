import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color metroTeal = Color(0xFF365F67);
  static const Color metroTealLight = Color(0xFF407079);
  static const Color metroGreen = Color(0xFF2CB901);
  static const Color metroGray = Color(0xFFACA9A9);
  static const Color metroCard = Color(0xFFC7C7C7);
  static const Color metroCardLight = Color(0xFFD9D9D9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.metroTeal,
        foregroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.daysOne(
          fontSize: 32,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.metroTeal,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white.withValues(alpha: 0.7),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.daysOne(
          fontSize: 28,
          color: AppColors.metroTeal,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: GoogleFonts.daysOne(
          fontSize: 18,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.nunitoSans(
          fontSize: 14,
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: GoogleFonts.nunitoSans(
          fontSize: 10,
          color: AppColors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
