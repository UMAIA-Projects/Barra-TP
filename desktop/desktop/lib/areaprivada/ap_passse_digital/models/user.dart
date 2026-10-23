class User {
  final String id;
  final String name;
  final double balance;
  final String? profileImage;

  User({
    required this.id,
    required this.name,
    required this.balance,
    this.profileImage,
  });

  User copyWith({
    String? id,
    String? name,
    double? balance,
    String? profileImage,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
