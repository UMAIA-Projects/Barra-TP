import 'package:flutter/material.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1200;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1200;
  }

  static double getMaxWidth(BuildContext context) {
    if (isMobile(context)) {
      return double.infinity;
    } else if (isTablet(context)) {
      return 600;
    } else {
      return 800;
    }
  }

  static EdgeInsets getPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(horizontal: 8);
    } else {
      return const EdgeInsets.symmetric(horizontal: 16);
    }
  }

  static double getIconSize(BuildContext context) {
    if (isMobile(context)) {
      return 24;
    } else {
      return 32;
    }
  }

  static double getFontSize(BuildContext context, double mobileSize) {
    if (isMobile(context)) {
      return mobileSize;
    } else {
      return mobileSize * 1.2;
    }
  }
}
