import 'package:flutter/material.dart';
import '../models/metro_models.dart';

class MetroProvider extends ChangeNotifier {
  int _selectedNavIndex = 0;
  
  MetroStation _currentStation = MetroStation(
    id: '1',
    name: 'Fórum Maia',
    lineCode: 'C',
    currentLocation: 'Viagem de Metro',
    nextArrivals: [
      MetroLine(
        id: '1',
        name: 'ISMAI',
        lineCode: 'C',
        arrivalMinutes: 1,
        arrivalTime: '31, 00:19',
      ),
      MetroLine(
        id: '2',
        name: 'Campanhã',
        lineCode: 'C',
        arrivalMinutes: 7,
        arrivalTime: '37, 00:25',
      ),
    ],
  );

  int get selectedNavIndex => _selectedNavIndex;
  MetroStation get currentStation => _currentStation;

  void selectNavItem(int index) {
    _selectedNavIndex = index;
    notifyListeners();
  }

  void updateStation(MetroStation station) {
    _currentStation = station;
    notifyListeners();
  }
}
