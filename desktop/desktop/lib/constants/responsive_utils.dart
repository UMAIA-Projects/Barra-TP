import 'package:flutter/material.dart';

class ResponsiveUtils {
  final BuildContext context;
  
  ResponsiveUtils(this.context);
  
  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;
  double get aspectRatio => screenWidth / screenHeight;
  bool get is16By9 => (aspectRatio - 1.777).abs() < 0.1;
  bool get is16By10 => (aspectRatio - 1.6).abs() < 0.1;
  
  double widthPercent(double percent) => screenWidth * (percent / 100);
  double heightPercent(double percent) => screenHeight * (percent / 100);
  
  double scaleWidth(double baseValue, {double baseScreenWidth = 1920}) {
    return (screenWidth / baseScreenWidth) * baseValue;
  }
  
  double scaleHeight(double baseValue, {double baseScreenHeight = 1080}) {
    return (screenHeight / baseScreenHeight) * baseValue;
  }
  
  double scaleFontSize(double baseSize, {double baseScreenWidth = 1920}) {
    final scale = screenWidth / baseScreenWidth;
    return baseSize * scale.clamp(0.6, 1.5);
  }
  
  double scaleUniform(double baseValue) {
    final scaleX = screenWidth / 1920;
    final scaleY = screenHeight / 1080;
    return baseValue * ((scaleX + scaleY) / 2);
  }
  
  double get sidebarWidth => scaleWidth(320);
  
  double get footerHeight => scaleHeight(87, baseScreenHeight: 1080);
  
  double get horizontalPadding => scaleWidth(32);
  
  double get verticalPadding => scaleHeight(24);
  
  double iconSize(double baseSize) => scaleUniform(baseSize);
  double spacing(double baseSpacing) => scaleUniform(baseSpacing);
  double borderRadius(double baseRadius) => scaleUniform(baseRadius);
  
  T responsive<T>({
    required T desktop,
  }) {
    return desktop;
  }
}

extension ResponsiveContext on BuildContext {
  ResponsiveUtils get responsive => ResponsiveUtils(this);
}
