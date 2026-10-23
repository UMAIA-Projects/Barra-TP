import 'package:flutter/material.dart';

/// Sistema de cores da app (claro + escuro)
class AppColors {
  AppColors._(); // construtor privado

  // PALETTE BASE (adaptar para a identidade visual da app)
  static const Color _primary = Color(0xFF365F67);
  static const Color _primaryDark = Color(0xFF365F67); // CORRIGIDO: era 0xFF4FB1FF
  static const Color _secondary = Color(0xFF1D79B3);
  static const Color _error = Color(0xFFB3261E);

  // ===========================
  // TEMA CLARO
  // ===========================
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: _primary,
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFD0E4FF),
    onPrimaryContainer: Color(0xFF001D36),
    secondary: _secondary,
    onSecondary: Colors.black,
    secondaryContainer: Color(0xFFFFE08A),
    onSecondaryContainer: Color(0xFF251A00),
    tertiary: Color(0xFF7B5BE6),
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFFE4DFFF),
    onTertiaryContainer: Color(0xFF190066),
    error: _error,
    onError: Colors.white,
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFFEFCE8),
    onSurface: Color(0xFF1F1F1F),
    surfaceContainer: Colors.white,
    surfaceContainerHighest: Color(0xFFE1E3EC),
    onSurfaceVariant: Color(0xFF44474F),
    outline: Color(0xFF74777F),
    outlineVariant: Color(0xFFC5C6CF),
    shadow: Colors.black,
    inverseSurface: Color(0xFF303034),
    onInverseSurface: Color(0xFFF2F0F4),
    inversePrimary: _primaryDark,
    surfaceTint: _primary,
  );

  // ===========================
  // TEMA ESCURO
  // ===========================
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: _primary, // CORRIGIDO: era Color.fromARGB(255, 5, 26, 3)
    onPrimary: Color(0xFF003256),
    primaryContainer: Color(0xFF004A7F),
    onPrimaryContainer: Color(0xFFD0E4FF),
    secondary: Color(0xFFFFCC4D),
    onSecondary: Color(0xFF3A2E00),
    secondaryContainer: Color(0xFF554400),
    onSecondaryContainer: Color(0xFFFFE08A),
    tertiary: Color(0xFFC8BFFF),
    onTertiary: Color(0xFF2E1A8B),
    tertiaryContainer: Color(0xFF4633C6),
    onTertiaryContainer: Color(0xFFE4DFFF),
    error: _error,
    onError: Colors.white,
    errorContainer: Color(0xFF8C1D18),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: Color(0xFF121212),
    onSurface: Color(0xFFE5E1E6),
    surfaceContainer: Color(0xFF1C1B1F),
    surfaceContainerHighest: Color(0xFF44474F),
    onSurfaceVariant: Color(0xFFC5C6CF),
    outline: Color(0xFF8E9099),
    outlineVariant: Color(0xFF44474F),
    shadow: Colors.black,
    inverseSurface: Color(0xFFE5E1E6),
    onInverseSurface: Color(0xFF1C1B1F),
    inversePrimary: _primary,
    surfaceTint: _primaryDark,
  );

  // ===========================
  // CORES ADICIONAIS
  // (Úteis para usar diretamente no código)
  // ===========================

  // Texto
  static const Color lightTextPrimary = Color(0xFF1F1F1F);
  static const Color lightTextSecondary = Color(0xFF5E5E5E);

  // Header Text color
  static const Color lightHeaderTextColor = Colors.white;
  static const Color darkHeaderTextColor = Color.fromARGB(255, 255, 255, 255);

  static const Color darkTextPrimary = Color(0xFFE5E1E6);
  static const Color darkTextSecondary = Color(0xFFA7A3AF);

  // Bordas
  static const Color lightBorder = Color(0xFFE0E0E0);
  static const Color darkBorder = Color(0xFF3A3A3A);

  // Campos de input
  static const Color lightInputBackground = Colors.white;
  static const Color darkInputBackground = Color(0xFF262626);

  // Background cinzento claro
  static const Color grayLight = Color(0xFFF5F5F5);

  // Estado
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF0288D1);

  static Color? get primaryLight => null;

  static Color headerText(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkHeaderTextColor
        : lightHeaderTextColor;
  }
}