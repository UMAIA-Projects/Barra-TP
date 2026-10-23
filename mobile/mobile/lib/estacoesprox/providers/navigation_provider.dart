import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _currentIndex = 2;
  String _activeTab = 'stations'; // 'stations' or 'favorites'
  String? _expandedStation;

  int get currentIndex => _currentIndex;
  String get activeTab => _activeTab;
  String? get expandedStation => _expandedStation;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setActiveTab(String tab) {
    _activeTab = tab;
    notifyListeners();
  }

  void toggleStation(String stationId) {
    _expandedStation = _expandedStation == stationId ? null : stationId;
    notifyListeners();
  }
}
