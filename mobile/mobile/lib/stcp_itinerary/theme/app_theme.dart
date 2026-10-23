import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF365F67);
  static const Color secondaryColor = Color(0xFF407079);
  static const Color greenColor = Color(0xFF2CB901);
  static const Color greenLightColor = Color(0xFF6BF051);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFF365F67);
  static const Color greyColor = Color(0xFFD9D9D9);
  static const Color borderColor = Color(0xFF365F67);

  // Text Styles
  static const TextStyle daysOneStyle = TextStyle(
    fontFamily: 'DaysOne',
    fontSize: 45,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle nunito13 = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  static const TextStyle nunito12Bold = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle nunito11Bold = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: textColor,
  );

  static const TextStyle nunito9 = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  static const TextStyle nunito9Bold = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 9,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static const TextStyle nunito7 = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 7,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static const TextStyle daysOne12 = TextStyle(
    fontFamily: 'DaysOne',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColor,
  );

  static const TextStyle daysOne13White = TextStyle(
    fontFamily: 'DaysOne',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
      ),
      fontFamily: 'NunitoSans',
    );
  }
}
