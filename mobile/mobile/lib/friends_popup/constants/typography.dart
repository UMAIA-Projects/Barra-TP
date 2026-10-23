import 'package:flutter/material.dart';

class AppTypography {
  // Nunito Sans font family
  static const String fontFamily = 'NunitoSans';

  // Header text style
  static const TextStyle headerLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  // Friend name text style
  static const TextStyle friendName = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  // Button text style
  static const TextStyle buttonText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  // Small text style
  static const TextStyle smallText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
}
