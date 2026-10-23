import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color teakDark = Color(0xFF365F67);
  static const Color teakMedium = Color(0xFF407079);
  static const Color grayLight = Color(0xFFD9D9D9);
  static const Color grayMedium = Color(0xFFACA9A9);
  static const Color white = Color(0xFFFFFFFF);
  static const Color blueOrigin = Color(0xFF2F89FF);
  static const Color redDestination = Color(0xFFFF0000);
  static const Color background = Color(0xFFF5F5F5);
  
  // Aliases para compatibilidade
  static const Color transitTeal = teakDark;
  static const Color transitTealDark = teakMedium;
  static const Color transitGray = grayMedium;
  static const Color transitLight = Color(0xFFEEEEEE);
  static const Color textPrimary = teakDark;
  static const Color textSecondary = grayMedium;
  static const Color surface = background;
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColors.teakDark,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'NunitoSans',
      colorScheme: ColorScheme.light(
        primary: AppColors.teakDark,
        secondary: AppColors.teakMedium,
        surface: Colors.white,
        onSurface: AppColors.teakDark,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.grayLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.teakDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.teakDark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.teakDark, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: GoogleFonts.nunitoSans(
          color: AppColors.grayMedium,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.teakMedium,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: AppColors.teakDark),
          ),
          elevation: 4,
          textStyle: GoogleFonts.nunitoSans(
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class AppTypography {
  static const String daysOneFont = 'DaysOne';
  static const String nunitoSansFont = 'NunitoSans';

  static TextStyle logoStyle = GoogleFonts.daysOne(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    shadows: const [
      Shadow(
        offset: Offset(0, 4),
        blurRadius: 4,
        color: Colors.black26,
      ),
    ],
  );

  static TextStyle buttonStyle = GoogleFonts.nunitoSans(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
  );

  static TextStyle inputStyle = GoogleFonts.nunitoSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.teakDark,
  );

  static TextStyle bodySmall = GoogleFonts.nunitoSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.teakDark,
  );

  static TextStyle labelSmall = GoogleFonts.nunitoSans(
    fontSize: 10,
    fontWeight: FontWeight.w200,
    color: AppColors.teakDark,
  );

  static TextStyle headingSmall = GoogleFonts.nunitoSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.teakDark,
  );
}