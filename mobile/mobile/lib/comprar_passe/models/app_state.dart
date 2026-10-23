import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  String _selectedPassType = '';
  bool _showPaymentMethods = false;
  
  String get selectedPassType => _selectedPassType;
  bool get showPaymentMethods => _showPaymentMethods;

  void selectPassType(String passType) {
    _selectedPassType = passType;
    notifyListeners();
  }

  void togglePaymentMethods() {
    _showPaymentMethods = !_showPaymentMethods;
    notifyListeners();
  }

  void reset() {
    _selectedPassType = '';
    _showPaymentMethods = false;
    notifyListeners();
  }
}

class PassType {
  final String id;
  final String label;

  PassType({required this.id, required this.label});
}

final List<PassType> passTypes = [
  PassType(id: 'animalia', label: 'Animália'),
  PassType(id: 'jovem', label: 'Jovem'),
  PassType(id: 'trabalhador', label: 'Trabalhador'),
  PassType(id: 'inclusivo', label: 'Inclusivo'),
  PassType(id: 'estudante', label: 'Estudante'),
  PassType(id: 'senior', label: 'Sénior'),
  PassType(id: 'militar', label: 'Militar'),
  PassType(id: 'pessoal', label: 'Pessoal'),
];
