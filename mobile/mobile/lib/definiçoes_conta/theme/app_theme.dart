import 'package:flutter/material.dart';

class AppTheme {
  static const Color brandPrimary = Color(0xFF365F67);
  static const Color brandSecondary = Color(0xFF407079);
  static const Color brandTeal = Color(0xFF365F67);
  static const Color brandLight = Color(0xFFEBEBEB);
  static const Color textDark = Color(0xFF365F67);
  static const Color destructive = Color(0xFFFF0000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color bgLight = Color(0xFFF3F4F6);
  static const Color backgroundColor = Color(0xFFFFFFFF);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: brandPrimary,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: bgLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: brandPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: white,
          fontSize: 28,
          fontWeight: FontWeight.w400,
          fontFamily: 'DaysOne',
        ),
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontFamily: 'DaysOne',
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: textDark,
        ),
        titleMedium: TextStyle(
          fontFamily: 'NunitoSans',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'NunitoSans',
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        bodySmall: TextStyle(
          fontFamily: 'NunitoSans',
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: brandPrimary,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: brandPrimary,
          foregroundColor: white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          textStyle: const TextStyle(
            fontFamily: 'NunitoSans',
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
