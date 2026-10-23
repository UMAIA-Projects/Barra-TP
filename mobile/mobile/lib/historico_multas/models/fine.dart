class Fine {
  final String id;
  final String transport;
  final String city;
  final String reason;
  final String ruleViolation;
  final String date;
  final String amount;
  final bool isPaid;

  Fine({
    required this.id,
    required this.transport,
    required this.city,
    required this.reason,
    required this.ruleViolation,
    required this.date,
    required this.amount,
    required this.isPaid,
  });

  factory Fine.fromJson(Map<String, dynamic> json) {
    return Fine(
      id: json['id'] as String,
      transport: json['transport'] as String,
      city: json['city'] as String,
      reason: json['reason'] as String,
      ruleViolation: json['ruleViolation'] as String,
      date: json['date'] as String,
      amount: json['amount'] as String,
      isPaid: json['isPaid'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'transport': transport,
    'city': city,
    'reason': reason,
    'ruleViolation': ruleViolation,
    'date': date,
    'amount': amount,
    'isPaid': isPaid,
  };
}
