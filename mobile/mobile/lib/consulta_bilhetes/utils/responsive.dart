import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class ResponsiveUtil {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < AppConstants.mobileBreakpoint;
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= AppConstants.mobileBreakpoint &&
        width < AppConstants.tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= AppConstants.tabletBreakpoint;
  }

  static double getResponsivePadding(BuildContext context) {
    if (isDesktop(context)) {
      return AppConstants.paddingLarge;
    } else if (isTablet(context)) {
      return AppConstants.paddingMedium;
    } else {
      return AppConstants.paddingSmall;
    }
  }

  static double getResponsiveFontSize(BuildContext context, double baseSize) {
    final width = MediaQuery.of(context).size.width;
    if (isDesktop(context)) {
      return baseSize * 1.2;
    } else if (isTablet(context)) {
      return baseSize * 1.0;
    } else {
      return baseSize * 0.9;
    }
  }

  static double getMaxWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (isDesktop(context)) {
      return 1200;
    } else if (isTablet(context)) {
      return 900;
    } else {
      return width;
    }
  }
}
