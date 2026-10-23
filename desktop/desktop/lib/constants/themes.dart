import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';

class AppTheme {
  // Quick access to theme properties
  static ThemeData get theme => lightTheme;
  
  // Text theme getter
  static TextTheme get textTheme => lightTheme.textTheme;
  
  static ColorScheme get colorScheme => lightTheme.colorScheme;
  
  // Color constants for use in const contexts
  static const Color primaryColor = Color(0xFF365F67);
  static const Color destructiveColor = Color(0xFFDC2828);
  static const Color textColor = Color(0xFF365F67);
  static const Color lightTextColor = Color(0xFF6B7280);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  
  // Text Styles
  static TextStyle get headerStyle => GoogleFonts.daysOne(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
        shadows: [
          const Shadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      );

  static TextStyle get titleStyle => GoogleFonts.nunitoSans(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        color: AppColors.barraTeal,
        shadows: [
          const Shadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],
      );

  static TextStyle get subtitleStyle => GoogleFonts.nunitoSans(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: AppColors.barraTeal,
      );

  static TextStyle get bodyStyle => GoogleFonts.nunitoSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      );

  static TextStyle get buttonStyle => GoogleFonts.nunitoSans(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.white,
      );

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      
      // Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.barraTeal,
        brightness: Brightness.light,
        primary: AppColors.barraTeal,
        secondary: AppColors.cyanLight,
        surface: AppColors.background,
        background: AppColors.bgLight,
        error: AppColors.error,
      ),
      
      // Scaffold
      scaffoldBackgroundColor: AppColors.bgLight,
      primaryColor: AppColors.barraTeal,
      
      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.barraTeal,
        foregroundColor: AppColors.white,
        elevation: 4,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: GoogleFonts.nunitoSans(
          color: AppColors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      
      // Text Theme
      textTheme: TextTheme(
        // Display styles (DaysOne font)
        displayLarge: GoogleFonts.daysOne(
          fontSize: 57,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        displayMedium: GoogleFonts.daysOne(
          fontSize: 45,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        displaySmall: GoogleFonts.daysOne(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        
        // Headline styles (Nunito Sans)
        headlineLarge: GoogleFonts.nunitoSans(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary,
        ),
        headlineMedium: GoogleFonts.nunitoSans(
          fontSize: 19,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        headlineSmall: GoogleFonts.nunitoSans(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        
        // Title styles
        titleLarge: GoogleFonts.nunitoSans(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        titleMedium: GoogleFonts.nunitoSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleSmall: GoogleFonts.nunitoSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        
        // Body styles
        bodyLarge: GoogleFonts.nunitoSans(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        bodyMedium: GoogleFonts.nunitoSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodySmall: GoogleFonts.nunitoSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.textSecondary,
        ),
        
        // Label styles
        labelLarge: GoogleFonts.nunitoSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        labelMedium: GoogleFonts.nunitoSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        labelSmall: GoogleFonts.nunitoSans(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
      ),
      
      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.cardBackground,
        elevation: 4,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        shadowColor: AppColors.shadowColor,
      ),
      
      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.inputBorder,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.inputBorder,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.barraTeal,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
        hintStyle: GoogleFonts.nunitoSans(
          color: AppColors.placeholder,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        labelStyle: GoogleFonts.nunitoSans(
          color: AppColors.barraTeal,
          fontWeight: FontWeight.w600,
        ),
      ),
      
      // Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.barraTeal,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 16,
          ),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: GoogleFonts.nunitoSans(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      
      // Checkbox Theme
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.barraTeal;
          }
          return Colors.transparent;
        }),
        checkColor: MaterialStateProperty.all(AppColors.white),
        side: const BorderSide(
          color: AppColors.barraTeal,
          width: 1.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      
      // Radio Theme
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.barraTeal;
          }
          return AppColors.barraTeal;
        }),
        overlayColor: MaterialStateProperty.all(
          AppColors.barraTeal.withOpacity(0.1),
        ),
      ),
    );
  }

  // Dark Theme (Optional)
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColors.barraTeal,
      scaffoldBackgroundColor: AppColors.backgroundDark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.barraTeal,
        secondary: AppColors.cyanLight,
        surface: AppColors.backgroundDark,
        background: AppColors.backgroundDark,
      ),
      textTheme: GoogleFonts.nunitoSansTextTheme(
        ThemeData.dark().textTheme,
      ),
    );
  }
}