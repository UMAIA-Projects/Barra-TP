import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF365F67); // tealDark
  static const Color secondaryColor = Color(0xFF407079);
  static const Color accentColor = Color(0xFFF8F8F8);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0xFF365F67);
  static const Color textColor = Color(0xFF365F67);
  static const Color lightGrey = Color(0xFFF8F8F8);

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        onPrimary: Colors.white,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.25),
        centerTitle: false,
        titleTextStyle: textStyle(
          color: Colors.white,
          fontSize: 45,
          fontWeight: FontWeight.w400,
          fontFamily: 'DaysOne',
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        elevation: 4,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor, width: 1.4),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor, width: 1.4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: primaryColor, width: 1.4),
        ),
        filled: true,
        fillColor: lightGrey,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryColor;
          }
          return Colors.white;
        }),
        checkColor: MaterialStateProperty.all(Colors.white),
        side: const BorderSide(color: borderColor, width: 0.74),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.7)),
      ),
      textTheme: TextTheme(
        headlineLarge: textStyle(
          fontSize: 45,
          fontWeight: FontWeight.w400,
          fontFamily: 'DaysOne',
          color: Colors.white,
        ),
        headlineMedium: textStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
        bodyLarge: textStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontFamily: 'NunitoSans',
        ),
        bodyMedium: textStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontFamily: 'NunitoSans',
        ),
        bodySmall: textStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: textColor,
          fontFamily: 'NunitoSans',
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
          elevation: 2.5,
          shadowColor: Colors.black.withValues(alpha: 0.4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
    );
  }
}
