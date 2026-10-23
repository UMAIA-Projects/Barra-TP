import 'package:flutter/material.dart';
import '../models/route.dart';
import '../models/transport_mode.dart';

class RoutePlanningProvider extends ChangeNotifier {
  // State variables
  RouteStop? _origin;
  RouteStop? _destination;
  TransportModeType _selectedMode = TransportModeType.walk;
  bool _avoidTolls = true;
  bool _avoidHighways = false;
  TransitRoute? _currentRoute;
  bool _isLoading = false;
  String? _error;

  // Getters
  RouteStop? get origin => _origin;
  RouteStop? get destination => _destination;
  TransportModeType get selectedMode => _selectedMode;
  bool get avoidTolls => _avoidTolls;
  bool get avoidHighways => _avoidHighways;
  TransitRoute? get currentRoute => _currentRoute;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Setters
  void setOrigin(RouteStop stop) {
    _origin = stop;
    _error = null;
    notifyListeners();
  }

  void setDestination(RouteStop stop) {
    _destination = stop;
    _error = null;
    notifyListeners();
  }

  void setSelectedMode(TransportModeType mode) {
    _selectedMode = mode;
    _error = null;
    notifyListeners();
  }

  void setAvoidTolls(bool value) {
    _avoidTolls = value;
    _error = null;
    notifyListeners();
  }

  void setAvoidHighways(bool value) {
    _avoidHighways = value;
    _error = null;
    notifyListeners();
  }

  void swapLocations() {
    final temp = _origin;
    _origin = _destination;
    _destination = temp;
    _error = null;
    notifyListeners();
  }

  Future<void> planRoute() async {
    if (_origin == null || _destination == null) {
      _error = 'Origem e destino são obrigatórios';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(milliseconds: 500));

      // Mock route data
      _currentRoute = TransitRoute(
        id: 'route_001',
        origin: _origin!,
        destination: _destination!,
        steps: [
          RouteStep(
            instruction: _origin!.name,
            direction: 'location',
          ),
          RouteStep(
            instruction: 'Siga para nordeste',
            distance: '40 m',
            direction: 'northeast',
          ),
        ],
        estimatedDuration: 31,
        distance: 2.3,
        departureTime: DateTime.now().add(const Duration(hours: 18, minutes: 4)),
        avoidTolls: _avoidTolls,
        avoidHighways: _avoidHighways,
      );

      _isLoading = false;
      _error = null;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Erro ao planejar rota: $e';
      notifyListeners();
    }
  }

  void clearRoute() {
    _currentRoute = null;
    _error = null;
    notifyListeners();
  }
}
