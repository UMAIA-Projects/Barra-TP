import 'package:flutter/material.dart';

class AppTheme {
  static const Color tealDark = Color(0xFF365F67);
  static const Color tealLight = Color(0xFF4A7A85);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grayLight = Color(0xFFF5F5F5);
  static const Color grayBorder = Color(0xFFE0E0E0);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textMuted = Color.fromARGB(179, 0, 0, 0);
  static const Color sendIconColor = Color(0xFF365F67);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: tealDark,
      scaffoldBackgroundColor: white,
      fontFamily: 'NunitoSans',
      appBarTheme: const AppBarTheme(
        backgroundColor: tealDark,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'DaysOne',
          fontSize: 45,
          fontWeight: FontWeight.w400,
          color: white,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          color: textMuted,
          fontWeight: FontWeight.w300,
          fontSize: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: grayBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: grayBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: tealDark, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        filled: true,
        fillColor: white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: tealDark,
        selectedItemColor: white,
        unselectedItemColor: white,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
