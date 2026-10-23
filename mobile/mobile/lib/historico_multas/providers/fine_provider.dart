import 'package:flutter/foundation.dart';
import '../models/fine.dart';

class FineProvider extends ChangeNotifier {
  String _activeTab = 'multas';
  
  final List<Fine> _fines = [
    Fine(
      id: 'F9TRI9GB1',
      transport: 'Metro',
      city: 'Setúbal',
      reason: 'Violação da regra 32',
      ruleViolation: 'Utilização de um Passe Digital Expirado',
      date: '13/09/2025',
      amount: '30€',
      isPaid: false,
    ),
    Fine(
      id: 'F9TRI9GB1',
      transport: 'Autocarro',
      city: 'Porto',
      reason: 'Violação da regra 45',
      ruleViolation: 'Ausência de cinto de segurança.',
      date: '13/09/2025',
      amount: '30€',
      isPaid: true,
    ),
  ];

  String get activeTab => _activeTab;
  List<Fine> get fines => _fines;
  
  int get totalFines => _fines.length;
  int get paidCount => _fines.where((f) => f.isPaid).length;
  int get unpaidCount => _fines.where((f) => !f.isPaid).length;
  
  double get totalAmount {
    return _fines.fold(0.0, (sum, fine) {
      final amount = double.parse(fine.amount.replaceAll('€', '').trim());
      return sum + amount;
    });
  }

  void setActiveTab(String tab) {
    _activeTab = tab;
    notifyListeners();
  }

  void addFine(Fine fine) {
    _fines.add(fine);
    notifyListeners();
  }

  void removeFine(String id) {
    _fines.removeWhere((fine) => fine.id == id);
    notifyListeners();
  }

  void togglePaymentStatus(int index) {
    if (index >= 0 && index < _fines.length) {
      final fine = _fines[index];
      _fines[index] = Fine(
        id: fine.id,
        transport: fine.transport,
        city: fine.city,
        reason: fine.reason,
        ruleViolation: fine.ruleViolation,
        date: fine.date,
        amount: fine.amount,
        isPaid: !fine.isPaid,
      );
      notifyListeners();
    }
  }
}
