import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  /// Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Get device padding (safe area)
  EdgeInsets get devicePadding => MediaQuery.of(this).padding;

  /// Get device view insets (keyboard height, etc)
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  /// Check if device is in landscape
  bool get isLandscape => MediaQuery.of(this).orientation == Orientation.landscape;

  /// Check if device is in portrait
  bool get isPortrait => MediaQuery.of(this).orientation == Orientation.portrait;

  /// Check if device is mobile (< 600dp)
  bool get isMobile => screenWidth < 600;

  /// Check if device is tablet (600dp - 1200dp)
  bool get isTablet => screenWidth >= 600 && screenWidth < 1200;

  /// Check if device is desktop (>= 1200dp)
  bool get isDesktop => screenWidth >= 1200;

  /// Get device pixel ratio
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// Check if device has notch
  bool get hasNotch => MediaQuery.of(this).padding.top > 24;

  /// Get text scale factor
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;

  /// Pop current route
  void pop<T>([T? result]) => Navigator.of(this).pop<T>(result);

  /// Push named route
  Future<T?> pushNamed<T>(
    String routeName, {
    Object? arguments,
  }) =>
      Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);

  /// Replace current route
  Future<T?> pushReplacementNamed<T, TO>(
    String routeName, {
    Object? arguments,
    TO? result,
  }) =>
      Navigator.of(this).pushReplacementNamed<T, TO>(
        routeName,
        arguments: arguments,
        result: result,
      );

  /// Push and remove until
  void popUntilNamed(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }
}

extension StringExtensions on String {
  /// Check if string is empty or null
  bool get isEmpty => trim().isEmpty;

  /// Check if string is not empty
  bool get isNotEmpty => trim().isNotEmpty;

  /// Capitalize first letter
  String get capitalize => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  /// Convert to title case
  String get toTitleCase {
    if (isEmpty) return this;
    return split(' ')
        .map((word) => word.isEmpty ? word : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}')
        .join(' ');
  }

  /// Check if string is email format
  bool get isEmail {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(this);
  }

  /// Check if string is numeric
  bool get isNumeric => num.tryParse(this) != null;
}

extension NumExtensions on num {
  /// Convert to duration
  Duration get asDuration => Duration(milliseconds: toInt());

  /// Check if number is positive
  bool get isPositive => this > 0;

  /// Check if number is negative
  bool get isNegative => this < 0;

  /// Check if number is zero
  bool get isZero => this == 0;

  /// Clamp number between min and max
  num clamp(num min, num max) {
    if (this < min) return min;
    if (this > max) return max;
    return this;
  }
}

extension WidgetExtensions on Widget {
  /// Add padding to widget
  Widget withPadding(EdgeInsets padding) => Padding(padding: padding, child: this);

  /// Add center alignment to widget
  Widget get center => Center(child: this);

  /// Add expanded to widget
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  /// Add opacity to widget
  Widget withAlpha(double alpha) => Opacity(opacity: alpha, child: this);

  /// Add custom widget above this widget
  Widget above(Widget widget) {
    return Column(
      children: [widget, this],
    );
  }

  /// Add custom widget below this widget
  Widget below(Widget widget) {
    return Column(
      children: [this, widget],
    );
  }

  /// Add custom widget to the left of this widget
  Widget leftOf(Widget widget) {
    return Row(
      children: [widget, this],
    );
  }

  /// Add custom widget to the right of this widget
  Widget rightOf(Widget widget) {
    return Row(
      children: [this, widget],
    );
  }
}
