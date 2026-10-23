import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF365F67);
  static const Color secondary = Color(0xFF407079);
  static const Color gray = Color(0xFFD9D9D9);
  static const Color darkGray = Color(0xFFACA9A9);
  static const Color lightGray = Color(0xFFEEE);
  static const Color lightBg = Color(0xFFF4F4F4);
  static const Color green = Color(0xFF2CB901);
  static const Color blue = Color(0xFF2F89FF);
  static const Color red = Color(0xFFFF0000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF1F1F1F);
  
  // Adicionando cores do transit_screen para compatibilidade
  static const Color transitTeal = Color(0xFF365F67);
  static const Color transitTealDark = Color(0xFF407079);
  static const Color transitGray = Color(0xFFACA9A9);
  static const Color transitLight = Color(0xFFEEEEEE);
  static const Color textPrimary = Color(0xFF365F67);
  static const Color textSecondary = Color(0xFFACA9A9);
  static const Color locationBlue = Color(0xFF2F89FF);
  static const Color locationRed = Color(0xFFFF0000);
  static const Color surface = Color(0xFFF4F4F4);
  static const Color background = Color(0xFFFFFFFF);
  static const Color grayMedium = Color(0xFFD9D9D9);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        elevation: 4,
        shadowColor: Colors.black26,
        centerTitle: false,
        titleTextStyle: GoogleFonts.daysOne(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        filled: true,
        fillColor: AppColors.lightGray,
        hintStyle: GoogleFonts.nunitoSans(
          fontSize: 14,
          color: AppColors.darkGray,
          fontWeight: FontWeight.w400,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: AppColors.primary),
          ),
          elevation: 4,
          textStyle: GoogleFonts.nunitoSans(
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      textTheme: TextTheme(
        bodySmall: GoogleFonts.nunitoSans(
          fontSize: 10,
          fontWeight: FontWeight.w200,
          color: AppColors.primary,
        ),
        bodyMedium: GoogleFonts.nunitoSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        bodyLarge: GoogleFonts.nunitoSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.primary,
        ),
        titleSmall: GoogleFonts.nunitoSans(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        titleMedium: GoogleFonts.nunitoSans(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
        titleLarge: GoogleFonts.daysOne(
          fontSize: 40,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.white,
        unselectedItemColor: Colors.white70,
        elevation: 0,
      ),
    );
  }
}