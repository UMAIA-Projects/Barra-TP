class AppConstants {
  // App Info
  static const String appName = 'BARRA TP';
  static const String appVersion = '1.0.0';

  // API Configuration
  static const String apiBaseUrl = 'https://api.example.com/v1';
  static const Duration apiTimeout = Duration(seconds: 30);

  // Map Configuration
  static const double defaultMapZoom = 15.0;
  static const double defaultMapCenterLat = 41.1579;
  static const double defaultMapCenterLng = -8.6291; // Porto, Portugal

  // UI Constants
  static const double cardElevation = 2.0;
  static const double defaultBorderRadius = 4.0;
  static const double defaultPadding = 16.0;
  static const double defaultSpacer = 12.0;

  // Font Sizes
  static const double fontSizeSmall = 8.0;
  static const double fontSizeExtraSmall = 9.0;
  static const double fontSizeRegular = 12.0;
  static const double fontSizeMedium = 13.0;
  static const double fontSizeLarge = 14.0;
  static const double fontSizeXLarge = 45.0; // For BARRA TP logo

  // Animation Durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 500);
  static const Duration longAnimationDuration = Duration(milliseconds: 1000);

  // Network Configuration
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);

  // Geolocation Radius
  static const double nearbyStationsRadius = 5.0; // km

  // Search Configuration
  static const int minSearchCharacters = 1;
  static const Duration searchDebounceTime = Duration(milliseconds: 500);
}
