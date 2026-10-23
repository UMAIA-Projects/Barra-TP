import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      colorScheme: const ColorScheme.light(
        primary: AppColors.brandTeal,        // VERDE-AZUL
        secondary: AppColors.brandTeal,
        surface: Colors.white,
        onPrimary: Colors.white,
        onSurface: AppColors.textPrimary,
      ),

      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'NunitoSans',
    );
  }
}
