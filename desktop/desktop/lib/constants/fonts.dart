import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static const Color primaryColor = Color(0xFF365F67); // Teal
  static const Color primaryDark = Color(0xFF2a4d54);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color foregroundColor = Color(0xFF365F67);
  static const Color accentColor = Color(0xFFF5F5F5);
  static const Color destructiveColor = Color(0xFFDC2828);
  static const Color mutedColor = Color(0xFF9A9A9A);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      elevation: 0,
      centerTitle: false,
    ),
    textTheme: GoogleFonts.nunitoSansTextTheme(
      ThemeData.light().textTheme,
    ),
    cardTheme: CardThemeData(
      color: backgroundColor,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  static TextStyle get headerStyle => GoogleFonts.daysOne(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    shadows: [
      const Shadow(
        color: Colors.black26,
        offset: Offset(0, 4),
        blurRadius: 4,
      ),
    ],
  );

  static TextStyle get titleStyle => GoogleFonts.nunitoSans(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: primaryColor,
    shadows: [
      const Shadow(
        color: Colors.black12,
        offset: Offset(0, 2),
        blurRadius: 2,
      ),
    ],
  );

  static TextStyle get subtitleStyle => GoogleFonts.nunitoSans(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: primaryColor,
  );

  static TextStyle get bodyStyle => GoogleFonts.nunitoSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: foregroundColor,
  );

  static TextStyle get buttonStyle => GoogleFonts.nunitoSans(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );
}