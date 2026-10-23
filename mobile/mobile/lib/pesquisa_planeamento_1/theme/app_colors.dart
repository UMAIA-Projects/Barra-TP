import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary Teal
  static const Color tealDark = Color(0xFF365F67);
  static const Color tealLight = Color(0xFF407079);

  // Grays
  static const Color grayLight = Color(0xFFF4F4F4);
  static const Color grayMedium = Color(0xFFD9D9D9);
  static const Color grayDark = Color(0xFFACA9A9);

  // Accents
  static const Color greenAccent = Color(0xFF009E05);
  static const Color blueAccent = Color(0xFF2F89FF);
  static const Color redAccent = Color(0xFFFF0000);

  // Neutral
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);

  // Borders
  static const Color borderColor = Color(0xFF365F67);
  
  // Aliases para compatibilidade com página 2
  static const Color primary = tealDark;
  static const Color secondary = tealLight;
  static const Color gray = grayMedium;
  static const Color darkGray = grayDark;
  static const Color lightGray = Color(0xFFEEE);
  static const Color lightBg = grayLight;
  static const Color green = greenAccent;
  static const Color blue = blueAccent;
  static const Color red = redAccent;
  
  // Adicionando cores do transit_screen para compatibilidade (sem duplicar)
  static const Color transitTeal = tealDark;
  static const Color transitTealDark = tealLight;
  static const Color transitGray = grayDark;
  static const Color transitLight = Color(0xFFEEEEEE);
  static const Color textPrimary = tealDark;
  static const Color textSecondary = grayDark;
  static const Color locationBlue = blueAccent;
  static const Color locationRed = redAccent;
  static const Color surface = grayLight;
  static const Color background = white;
}

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.tealDark,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.tealDark,
        elevation: 4,
        shadowColor: Colors.black26,
        centerTitle: true,
        toolbarHeight: 120,
        titleTextStyle: GoogleFonts.daysOne(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.grayMedium,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.tealLight, width: 2),
        ),
        hintStyle: GoogleFonts.nunitoSans(
          fontSize: 14,
          color: AppColors.grayDark,
          fontWeight: FontWeight.w400,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.tealLight,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: AppColors.tealDark),
          ),
          elevation: 4,
          textStyle: GoogleFonts.nunitoSans(
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.daysOne(
          fontSize: 40,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
        titleLarge: GoogleFonts.nunitoSans(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.tealDark,
        ),
        titleMedium: GoogleFonts.nunitoSans(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: AppColors.tealDark,
        ),
        titleSmall: GoogleFonts.nunitoSans(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppColors.tealDark,
        ),
        bodyLarge: GoogleFonts.nunitoSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.tealDark,
        ),
        bodyMedium: GoogleFonts.nunitoSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColors.tealDark,
        ),
        bodySmall: GoogleFonts.nunitoSans(
          fontSize: 10,
          fontWeight: FontWeight.w200,
          color: AppColors.tealDark,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.tealDark,
        selectedItemColor: AppColors.white,
        unselectedItemColor: Colors.white70,
        elevation: 0,
      ),
    );
  }
}