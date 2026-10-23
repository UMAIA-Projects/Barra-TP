import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // BARRA TP Brand Colors
  static const Color brandTeal = Color(0xFF365F67);
  static const Color brandTealLight = Color(0xFF407079);
  static const Color brandSuccess = Color(0xFF4A9C5B);
  static const Color brandDanger = Color(0xFFDC2828);
  static const Color brandText = Color(0xFF365F67);
  static const Color brandTextSecondary = Color(0xFF5D6478);
  
  static const Color backgroundColor = Colors.white;
  static const Color borderColor = Color(0xFFDDE1E6);
  
  // Aliases para compatibilidade com historico_viagens
  static const Color primaryColor = brandTeal;
  static const Color secondaryColor = brandTealLight;

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: brandTeal,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: brandTeal,
      elevation: 4,
      centerTitle: false,
    ),
    textTheme: _buildTextTheme(),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
  );

  static TextTheme _buildTextTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.daysOne(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.daysOne(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: brandText,
      ),
      titleLarge: GoogleFonts.nunitoSans(
        fontSize: 15,
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.nunitoSans(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: brandText,
      ),
      bodySmall: GoogleFonts.nunitoSans(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: brandTextSecondary,
      ),
    );
  }
}
