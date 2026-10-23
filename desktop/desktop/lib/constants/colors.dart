import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  static const Color barraTeal = Color(0xFF365F67);
  static const Color primary = Color(0xFF365F67);
  static const Color barraTealLight = Color(0xFF4A7A84);
  static const Color barraTealDark = Color(0xFF254447);
  
  // Secondary Brand Colors
  static const Color barraBlue = Color(0xFF1D79B3);
  static const Color cyanLight = Color(0xFF6ED2E7);
  static const Color blueBright = Color(0xFF35D1FD);
  static const Color accentColor = Color(0xFF4a7f8f);
  static const Color secondaryDark = Color(0xFF2a4d54);
  
  // Green Shades
  static const Color mintGreen = Color(0xFFBBECD8);
  static const Color greenBright = Color(0xFF6BF051);
  
  // Accent Colors
  static const Color yellowStar = Color(0xFFF4E651);
  static const Color redAlert = Color(0xFFED0000);
  
  // Bus Line Colors
  static const Color busYellow = Color(0xFFF8CF00);
  static const Color busCyan = Color(0xFF35D1FD);
  static const Color busGreen = Color(0xFF2DF800);
  
  // Train Line Colors
  static const Color trainRed = Color(0xFFEB4343);
  static const Color trainOrange = Color(0xFFF0B851);
  static const Color trainYellow = Color(0xFFF8D825);
  static const Color trainGreen = Color(0xFF259D01);
  static const Color trainCyan = Color(0xFF3FB9DA);
  static const Color trainMagenta = Color(0xFFE642D1);
  static const Color trainPurple = Color(0xFF7869FE);
  static const Color trainBlue = Color(0xFF647DD2);
  
  // Metro Line Colors
  static const Color metroCyan = Color(0xFF35D1FD);
  static const Color metroRed = Color(0xFFB93201);
  static const Color metroGreen = Color(0xFF2CB901);
  static const Color metroYellow = Color(0xFFF5C919);
  static const Color metroPurple = Color(0xFF9B88A7);
  static const Color metroOrange = Color(0xFFEE9B00);
  
  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color black87 = Color(0xDD000000);
  static const Color blackHeader = Color(0xFF090909);
  static const Color transparent = Color(0x00000000);
  static const Color barraGray = Color(0xFF6A6666);
  static const Color gray = Color(0xFFE0DFDF);
  static const Color lightGray = Color(0xFFF3F3F3);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey600 = Color(0xFF757575);
  static const Color bgLight = Color(0xFFF8F8F8);
  static const Color background = Color(0xFFFAFAFA);
  static const Color backgroundLight = Color(0xFFFAFAF9);
  static const Color barraLightBg = Color(0xFFE8F1F2);
  static const Color backgroundDark = Color(0xFF1a2f35);
  static const Color slate100 = Color(0xFFF1F5F9);
  static const Color slate400 = Color(0xFF94A3B8);
  static const Color slate500 = Color(0xFF64748B);
  static const Color slate700 = Color(0xFF475569);
  static const Color greenBright2 = Color(0xFF78F04E);
  
  // UI Element Colors
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color primaryForeground = Color(0xFFFFFFFF);
  static const Color inputBorder = Color(0xFF365F67);
  static const Color placeholder = Color(0xFF6A6666);
  static const Color divider = Color(0xFFE5E7EB);
  static const Color border = Color(0xFFD1D5DB);
  static const Color accentLight = Color(0xFFF5F5F5);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF365F67);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFFFFFEFF);
  static const Color lightTextColor = Color(0xFF6B7280);
  static const Color mutedColor = Color(0xFF9A9A9A);
  
  // Status Colors
  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color destructive = Color(0xFFDC2828);
  static const Color warning = Color(0xFFFCD34D);
  static const Color info = Color(0xFF3B82F6);
  
  // Shadow Color
  static const Color shadowColor = Color.fromARGB(64, 0, 0, 0);
  
  // Sidebar Background Colors (alternating pattern)
  static const List<Color> sidebarColors = [
    mintGreen,
    cyanLight,
    mintGreen,
    cyanLight,
    mintGreen,
    cyanLight,
  ];
  
  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [barraTeal, barraTealLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // MaterialColor for ThemeData.primarySwatch
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF365F67,
    <int, Color>{
      50: Color(0xFFE8F1F2),
      100: Color(0xFFC4DDE0),
      200: Color(0xFF9CC7CD),
      300: Color(0xFF74B1BA),
      400: Color(0xFF56A0AB),
      500: Color(0xFF365F67),
      600: Color(0xFF30575F),
      700: Color(0xFF294D54),
      800: Color(0xFF22434A),
      900: Color(0xFF163238),
    },
  );
}

class AppShadows {
  // Standard shadow
  static const BoxShadow standard = BoxShadow(
    color: Color.fromARGB(64, 0, 0, 0),
    blurRadius: 4,
    offset: Offset(0, 4),
  );
  
  // Default shadow with different offset
  static const BoxShadow defaultShadow = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.25),
    blurRadius: 4,
    offset: Offset(4, 4),
  );
  
  // Drop shadow list
  static const List<BoxShadow> dropShadow = [
    BoxShadow(
      color: Color.fromARGB(64, 0, 0, 0),
      blurRadius: 4,
      offset: Offset(0, 4),
    ),
  ];
  
  // Shadow color for overlay effects
  static const Color shadow = Color(0x40000000);
}

// Alias for backwards compatibility with BarraColors
class BarraColors {
  static const Color teal = AppColors.barraTeal;
  static const Color lightGreen = AppColors.mintGreen;
  static const Color lightTeal = AppColors.cyanLight;
  static const Color background = AppColors.background;
  static const Color gray = AppColors.barraGray;
  static const Color white = AppColors.white;
  static const Color black = AppColors.black;
}