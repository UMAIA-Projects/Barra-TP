import 'package:flutter/foundation.dart';
import '../models/trip_model.dart';

class TripProvider extends ChangeNotifier {
  String _activeTab = 'viagens';
  List<Trip> _trips = [];

  String get activeTab => _activeTab;
  List<Trip> get trips => _trips;

  TripProvider() {
    _initializeTrips();
  }

  void _initializeTrips() {
    _trips = [
      Trip(
        id: '1',
        company: 'Barra TP',
        departureTime: '15:30',
        departureLocation: 'Lisboa (Oriente)',
        arrivalTime: '18:50',
        arrivalLocation: 'Porto (Campanhã)',
        date: '24/01/2024',
        seats: '1 lugar (adulto)',
        type: 'direto',
        duration: '03h 20m',
        distance: '306km',
        price: '-7,50€',
      ),
      Trip(
        id: '2',
        company: 'Barra TP',
        departureTime: '09:00',
        departureLocation: 'Braga',
        arrivalTime: '14:20',
        arrivalLocation: 'Braga (Oriente)',
        date: '14/08/2023',
        seats: '2 lugares (adulto)',
        type: 'com paragens',
        duration: '05h 20m',
        distance: '430km',
        price: '-39,90€',
      ),
    ];
  }

  void setActiveTab(String tab) {
    _activeTab = tab;
    notifyListeners();
  }

  void addTrip(Trip trip) {
    _trips.add(trip);
    notifyListeners();
  }

  void removeTrip(String id) {
    _trips.removeWhere((trip) => trip.id == id);
    notifyListeners();
  }
}
