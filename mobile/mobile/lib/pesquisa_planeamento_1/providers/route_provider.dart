import 'package:flutter/foundation.dart';
import '../models/route_model.dart';

class RouteProvider extends ChangeNotifier {
  String origin = 'Mandim';
  String destination = 'Universidade da Maia - UMaia';
  String selectedTransportMode = 'car';
  bool avoidTolls = true;
  bool avoidHighways = false;
  String departureTime = '18:04';
  bool showDepartureTimePicker = false;

  late RouteModel currentRoute;
  bool isLoading = false;
  String? error;

  RouteProvider() {
    _initializeDefaultRoute();
  }

  void _initializeDefaultRoute() {
    currentRoute = RouteModel(
      id: '1',
      origin: origin,
      destination: destination,
      duration: 5,
      distance: 2.7,
      transportMode: selectedTransportMode,
      departureTime: departureTime,
      avoidTolls: avoidTolls,
      avoidHighways: avoidHighways,
      mapImageUrl:
          'https://api.builder.io/api/v1/image/assets/TEMP/d8114e83c3b67824f1ce0070a5ec87bc6d4fdaf9?width=876',
      steps: [
        RouteStep(
          instruction: 'Siga a sudeste em direção a R. Vieiro',
          distance: 110,
          icon: 'directions',
        ),
      ],
    );
  }

  void updateOrigin(String value) {
    origin = value;
    currentRoute = RouteModel(
      id: currentRoute.id,
      origin: origin,
      destination: destination,
      duration: currentRoute.duration,
      distance: currentRoute.distance,
      transportMode: selectedTransportMode,
      departureTime: departureTime,
      avoidTolls: avoidTolls,
      avoidHighways: avoidHighways,
      mapImageUrl: currentRoute.mapImageUrl,
      steps: currentRoute.steps,
    );
    notifyListeners();
  }

  void updateDestination(String value) {
    destination = value;
    currentRoute = RouteModel(
      id: currentRoute.id,
      origin: origin,
      destination: destination,
      duration: currentRoute.duration,
      distance: currentRoute.distance,
      transportMode: selectedTransportMode,
      departureTime: departureTime,
      avoidTolls: avoidTolls,
      avoidHighways: avoidHighways,
      mapImageUrl: currentRoute.mapImageUrl,
      steps: currentRoute.steps,
    );
    notifyListeners();
  }

  void updateTransportMode(String mode) {
    selectedTransportMode = mode;
    notifyListeners();
  }

  void toggleAvoidTolls() {
    avoidTolls = !avoidTolls;
    notifyListeners();
  }

  void toggleAvoidHighways() {
    avoidHighways = !avoidHighways;
    notifyListeners();
  }

  void updateDepartureTime(String time) {
    departureTime = time;
    notifyListeners();
  }

  void toggleDepartureTimePicker() {
    showDepartureTimePicker = !showDepartureTimePicker;
    notifyListeners();
  }

  void swapOriginDestination() {
    final temp = origin;
    origin = destination;
    destination = temp;
    updateOrigin(origin);
    updateDestination(destination);
  }

  Future<void> fetchRoute() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));
      _initializeDefaultRoute();
      currentRoute = RouteModel(
        id: currentRoute.id,
        origin: origin,
        destination: destination,
        duration: currentRoute.duration,
        distance: currentRoute.distance,
        transportMode: selectedTransportMode,
        departureTime: departureTime,
        avoidTolls: avoidTolls,
        avoidHighways: avoidHighways,
        mapImageUrl: currentRoute.mapImageUrl,
        steps: currentRoute.steps,
      );
    } catch (e) {
      error = 'Failed to fetch route: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
