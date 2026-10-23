import 'package:flutter/material.dart';

class BarraTPColors {
  // Primary colors
  static const Color teal = Color(0xFF365F67);
  static const Color tealDark = Color(0xFF407079);
  static const Color background = Colors.white;
  static const Color lightGray = Color(0xFFE6E6E6);
  static const Color mediumGray = Color(0xFFD9D9D9);
  static const Color darkGray = Color(0xFF1F1F1F);
  static const Color hintGray = Color(0xFFACA9A9);

  // Metro line colors
  static const Color lineA = Color(0xFF35D1FD); // Azul
  static const Color lineB = Color(0xFFB93201); // Vermelha
  static const Color lineC = Color(0xFF2CB901); // Verde
  static const Color lineD = Color(0xFFF5C919); // Amarela
  static const Color lineE = Color(0xFF9B88A7); // Violeta
  static const Color lineF = Color(0xFFEE9B00); // Laranja

  // Text colors
  static const Color textPrimary = BarraTPColors.teal;
  static const Color textWhite = Colors.white;
  static const Color textSecondary = BarraTPColors.hintGray;
}

// Helper function to get line color by ID
Color getLineColor(String lineId) {
  switch (lineId) {
    case 'A':
      return BarraTPColors.lineA;
    case 'B':
    case 'Bx':
      return BarraTPColors.lineB;
    case 'C':
      return BarraTPColors.lineC;
    case 'D':
      return BarraTPColors.lineD;
    case 'E':
      return BarraTPColors.lineE;
    case 'F':
      return BarraTPColors.lineF;
    default:
      return BarraTPColors.teal;
  }
}
