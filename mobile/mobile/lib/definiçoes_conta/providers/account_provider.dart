import 'package:flutter/foundation.dart';
import '../models/account_model.dart';

class AccountProvider extends ChangeNotifier {
  late AccountInfo _accountInfo;

  AccountInfo get accountInfo => _accountInfo;

  int _activeTabIndex = 0;
  int get activeTabIndex => _activeTabIndex;

  AccountProvider() {
    _initializeAccountInfo();
  }

  void _initializeAccountInfo() {
    _accountInfo = AccountInfo(
      fullName: 'Gertrudes Almeida Silva',
      displayName: 'Gertrudes Silva',
      username: 'gertrudess',
      email: 'gertrudesilva467@gmail.com',
      secondaryEmail: 'gertrudagameplays@gmail.com',
      phone: '915807876',
      friendshipCode: '1HAI8',
    );
  }

  void updateFullName(String name) {
    _accountInfo = _accountInfo.copyWith(fullName: name);
    notifyListeners();
  }

  void updateDisplayName(String name) {
    _accountInfo = _accountInfo.copyWith(displayName: name);
    notifyListeners();
  }

  void updateUsername(String username) {
    _accountInfo = _accountInfo.copyWith(username: username);
    notifyListeners();
  }

  void updateEmail(String email) {
    _accountInfo = _accountInfo.copyWith(email: email);
    notifyListeners();
  }

  void updateSecondaryEmail(String email) {
    _accountInfo = _accountInfo.copyWith(secondaryEmail: email);
    notifyListeners();
  }

  void updatePhone(String phone) {
    _accountInfo = _accountInfo.copyWith(phone: phone);
    notifyListeners();
  }

  void setActiveTab(int index) {
    _activeTabIndex = index;
    notifyListeners();
  }

  Future<void> changePassword(String newPassword) async {
    // Implement password change logic
    await Future.delayed(const Duration(seconds: 1));
    notifyListeners();
  }

  Future<void> endSession() async {
    // Implement session end logic
    await Future.delayed(const Duration(seconds: 1));
    notifyListeners();
  }

  Future<void> deactivateAccount() async {
    // Implement account deactivation logic
    await Future.delayed(const Duration(seconds: 1));
    notifyListeners();
  }

  Future<void> deleteAccount() async {
    // Implement account deletion logic
    await Future.delayed(const Duration(seconds: 1));
    notifyListeners();
  }
}
