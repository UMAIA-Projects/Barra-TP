class Message {
  final String id;
  final String text;
  final DateTime timestamp;
  final bool isUser;

  Message({
    required this.id,
    required this.text,
    required this.timestamp,
    required this.isUser,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] as String,
      text: json['text'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isUser: json['isUser'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'timestamp': timestamp.toIso8601String(),
      'isUser': isUser,
    };
  }
}
