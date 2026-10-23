import 'package:flutter/material.dart';
import '../../models/route_model.dart';
import '../../models/filter_model.dart';

class AppProvider with ChangeNotifier {
  int _currentTabIndex = 0;
  bool _showFilters = true;
  
  String _origin = 'Aeroporto';
  String _destination = 'Maia';
  DateTime _departureTime = DateTime(2024, 11, 10, 20, 40);
  DateTime _arrivalTime = DateTime(2024, 11, 10, 11, 0);
  
  late FilterModel _filters;
  late List<RouteModel> _routes;
  int _bottomNavIndex = 0;

  // Getters
  int get currentTabIndex => _currentTabIndex;
  bool get showFilters => _showFilters;
  String get origin => _origin;
  String get destination => _destination;
  DateTime get departureTime => _departureTime;
  DateTime get arrivalTime => _arrivalTime;
  FilterModel get filters => _filters;
  List<RouteModel> get routes => _routes;
  int get bottomNavIndex => _bottomNavIndex;

  AppProvider() {
    _initializeFilters();
    _initializeRoutes();
  }

  void _initializeFilters() {
    _filters = FilterModel(
      transportTypes: {
        'Autocarro': false,
        'Comboio': false,
        'Metro': false,
      },
      priceRanges: {
        '0 € - 75 €': false,
        '75 € - 150 €': false,
        '150 € - 225 €': false,
        'Personalizado': false,
      },
    );
  }

  void _initializeRoutes() {
    _routes = [
      RouteModel(
        id: 1,
        departure: '20:57',
        arrival: '21:17',
        segments: ['walk', 'bus_604'],
        busNumbers: ['604'],
        metroLines: [],
        duration: 20,
      ),
      RouteModel(
        id: 2,
        departure: '20:57',
        arrival: '21:26',
        segments: ['bus_602', 'metro_c', 'walk'],
        busNumbers: ['602'],
        metroLines: ['C'],
        duration: 29,
      ),
      RouteModel(
        id: 3,
        departure: '21:09',
        arrival: '21:56',
        segments: ['walk', 'metro_e', 'metro_c', 'walk'],
        busNumbers: [],
        metroLines: ['E', 'C'],
        duration: 47,
      ),
      RouteModel(
        id: 4,
        departure: '21:30',
        arrival: '22:26',
        segments: ['walk', 'metro_e', 'metro_c', 'walk'],
        busNumbers: [],
        metroLines: ['E', 'C'],
        duration: 56,
      ),
    ];
  }

  void setCurrentTab(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }

  void toggleFilters() {
    _showFilters = !_showFilters;
    notifyListeners();
  }

  void setOrigin(String origin) {
    _origin = origin;
    notifyListeners();
  }

  void setDestination(String destination) {
    _destination = destination;
    notifyListeners();
  }

  void setDepartureTime(DateTime time) {
    _departureTime = time;
    notifyListeners();
  }

  void setArrivalTime(DateTime time) {
    _arrivalTime = time;
    notifyListeners();
  }

  void updateFilter(String filterType, String filterKey, bool value) {
    if (filterType == 'transport') {
      _filters.transportTypes[filterKey] = value;
    } else if (filterType == 'price') {
      _filters.priceRanges[filterKey] = value;
    }
    notifyListeners();
  }

  void setBottomNavIndex(int index) {
    _bottomNavIndex = index;
    notifyListeners();
  }

  void searchRoutes() {
    // Placeholder for actual search logic
    notifyListeners();
  }
}
