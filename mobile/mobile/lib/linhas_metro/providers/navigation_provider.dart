import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  String _activeTab = 'metro';
  String _searchQuery = '';

  String get activeTab => _activeTab;
  String get searchQuery => _searchQuery;

  void setActiveTab(String tab) {
    _activeTab = tab;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
