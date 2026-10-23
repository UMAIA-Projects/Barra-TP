import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String _activeTab = 'autocarro';
  String _activeNavItem = 'home';
  String _searchQuery = '';

  String get activeTab => _activeTab;
  String get activeNavItem => _activeNavItem;
  String get searchQuery => _searchQuery;

  void setActiveTab(String tab) {
    _activeTab = tab;
    notifyListeners();
  }

  void setActiveNavItem(String item) {
    _activeNavItem = item;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
