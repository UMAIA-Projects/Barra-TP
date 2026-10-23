class User {
  final String fullName;
  final String displayName;
  final String primaryEmail;
  final String secondaryEmail;
  final String phone;
  final double balance;

  User({
    required this.fullName,
    required this.displayName,
    required this.primaryEmail,
    required this.secondaryEmail,
    required this.phone,
    required this.balance,
  });

  factory User.dummy() {
    return User(
      fullName: 'Gertrudes Almeida Silva',
      displayName: 'Gertrudes Silva',
      primaryEmail: 'gertrudesilva467@gmail.com',
      secondaryEmail: 'gertrudagameplays@gmail.com',
      phone: '915807876',
      balance: 22.50,
    );
  }
}
