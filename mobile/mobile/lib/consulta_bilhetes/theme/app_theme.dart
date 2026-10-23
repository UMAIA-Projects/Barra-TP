import 'package:flutter/material.dart';

class AppColors {
  // Cores principais da Barra TP
  static const Color barrateal = Color(0xFF365F67); // Azul esverdeado
  static const Color barraorange = Color(0xFFE89B1E); // Laranja
  static const Color barraGray = Color(0xFF555555); // Cinza escuro
  
  // Cores auxiliares
  static const Color barraGrayDark = Color(0xFF333333); // Cinza mais escuro
  static const Color barraRed = Color(0xFFE53935); // Vermelho
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color mediumGray = Color(0xFFE0E0E0);
  static const Color darkGray = Color(0xFF757575);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color green = Color(0xFF4CAF50);
  static const Color blue = Color(0xFF2196F3);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.barrateal,
      colorScheme: ColorScheme.light(
        primary: AppColors.barrateal,
        secondary: AppColors.barraorange,
        background: AppColors.lightGray,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.barrateal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.barrateal,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.barrateal,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.barrateal),
          foregroundColor: AppColors.barrateal,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}