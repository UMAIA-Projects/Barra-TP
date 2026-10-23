import 'package:flutter/foundation.dart';
import '../models/message_model.dart';

class ChatProvider extends ChangeNotifier {
  final List<Message> _messages = [];
  int _currentTab = 0;

  List<Message> get messages => _messages;
  int get currentTab => _currentTab;

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      timestamp: DateTime.now(),
      isUser: true,
    );

    _messages.add(message);

    // Simulate bot response after a short delay
    Future.delayed(const Duration(milliseconds: 500), () {
      final botMessage = Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: 'Esta é uma resposta automática de AI Gertrudes.',
        timestamp: DateTime.now(),
        isUser: false,
      );
      _messages.add(botMessage);
      notifyListeners();
    });

    notifyListeners();
  }

  void setCurrentTab(int index) {
    _currentTab = index;
    notifyListeners();
  }

  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }
}
