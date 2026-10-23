import 'package:flutter/material.dart';

class BarraColors {
  static const Color primary = Color(0xFF365F67); // Teal
  static const Color secondary = Color(0xFF407079); // Darker teal
  static const Color lightGray = Color(0xFFD9D9D9);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color lightGrayBackground = Color(0xFFD9D9D9);
  
  // Opacity variants
  static const Color lightGrayBg50 = Color.fromARGB(128, 217, 217, 217);
}

class BarraTheme {
  static const TextStyle headingLarge = TextStyle(
    fontFamily: 'DaysOne',
    fontSize: 45,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const TextStyle headingMedium = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 15,
    fontWeight: FontWeight.w800,
    color: BarraColors.primary,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: BarraColors.primary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: BarraColors.primary,
  );

  static const TextStyle buttonText = TextStyle(
    fontFamily: 'NunitoSans',
    fontSize: 12,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  static const TextStyle tabText = TextStyle(
    fontFamily: 'DaysOne',
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
}
