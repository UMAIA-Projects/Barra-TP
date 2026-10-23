import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF365F67);
  static const Color secondary = Color(0xFF407079);
  static const Color accent = Color(0xFF2DF800);
  static const Color light = Color(0xFFF8F8F8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color background = Color(0xFFFAFAFA);
  static const Color border = Color(0xFFE0E0E0);
  
  // Metro line colors
  static const Color metroGreen = Color(0xFF2CB901);
  static const Color metroPurple = Color(0xFF9B88A7);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
      ),
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.25),
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.light,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white.withValues(alpha: 0.7),
        elevation: 4,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.daysOne(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
          shadows: [
            Shadow(
              offset: const Offset(0, 4),
              blurRadius: 4,
              color: Colors.black.withValues(alpha: 0.25),
            ),
          ],
        ),
        headlineSmall: GoogleFonts.nunitoSans(
          fontSize: 16,
          fontWeight: FontWeight.w800,
          color: AppColors.primary,
        ),
        bodyLarge: GoogleFonts.nunitoSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.primary,
        ),
        bodyMedium: GoogleFonts.nunitoSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        bodySmall: GoogleFonts.nunitoSans(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: AppColors.primary,
        ),
        labelSmall: GoogleFonts.nunitoSans(
          fontSize: 9,
          fontWeight: FontWeight.w800,
          color: AppColors.white,
        ),
      ),
    );
  }

  static TextStyle textStyle({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
    String fontFamily = 'NunitoSans',
  }) {
    if (fontFamily == 'DaysOne') {
      return GoogleFonts.daysOne(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      );
    }
    return GoogleFonts.nunitoSans(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
