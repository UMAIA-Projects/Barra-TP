import 'package:flutter/material.dart';

class AppTypography {
  AppTypography._(); // construtor privado

  static const String _fontFamily = 'Inter';

  /// TextTheme base para a app
  static TextTheme textTheme = const TextTheme(
    // Títulos principais de ecrã (ex: "Login", "Dashboard")
    headlineSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 1.2,
      letterSpacing: 0.0,
    ),

    // Subtítulos / secções
    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 1.3,
      letterSpacing: 0.0,
    ),

    // Texto principal (parágrafos)
    bodyLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.4,
      letterSpacing: 0.0,
    ),

    // Texto secundário / legendas
    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.4,
      letterSpacing: 0.0,
    ),

    // Labels de botões principais
    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.2,
      letterSpacing: 0.0,
    ),

    // Labels pequenos (chips, tags, etc.)
    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 1.2,
      letterSpacing: 0.0,
    ),
  );

  /// Helpers convenientes (se quiseres usar diretamente)
  static TextStyle get title => textTheme.headlineSmall!; // títulos de ecrã

  static TextStyle get subtitle => textTheme.titleMedium!; // subtítulos

  static TextStyle get body => textTheme.bodyLarge!; // texto principal

  static TextStyle get bodySmall => textTheme.bodyMedium!; // texto secundário

  static TextStyle get button => textTheme.labelLarge!; // botões

  static TextStyle get tag => textTheme.labelMedium!; // labels pequenos

  static TextStyle get headerText => const TextStyle(
        fontFamily: 'daysOne',
        fontSize: 44,
        fontWeight: FontWeight.w700,
        height: 1.2,
      );
}