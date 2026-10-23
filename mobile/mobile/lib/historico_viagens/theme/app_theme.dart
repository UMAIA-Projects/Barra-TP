import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF365F67);
  static const Color secondaryColor = Color(0xFF407079);
  static const Color accentColor = Color(0xFFF52424);
  static const Color textPrimary = Color(0xFF5D6478);
  static const Color textSecondary = Color(0xFF8E93A2);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFF365F67);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 4,
        centerTitle: false,
        titleTextStyle: GoogleFonts.daysOne(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.daysOne(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          color: primaryColor,
        ),
        headlineSmall: GoogleFonts.daysOne(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: primaryColor,
        ),
        bodyLarge: GoogleFonts.nunitoSans(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: textPrimary,
        ),
        bodyMedium: GoogleFonts.nunitoSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: textSecondary,
        ),
        bodySmall: GoogleFonts.nunitoSans(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: textSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          elevation: 4,
          textStyle: GoogleFonts.nunitoSans(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
