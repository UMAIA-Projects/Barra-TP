class AccountInfo {
  final String fullName;
  final String displayName;
  final String username;
  final String email;
  final String secondaryEmail;
  final String phone;
  final String friendshipCode;
  final String profileImageUrl;

  AccountInfo({
    required this.fullName,
    required this.displayName,
    required this.username,
    required this.email,
    required this.secondaryEmail,
    required this.phone,
    required this.friendshipCode,
    this.profileImageUrl = '',
  });

  AccountInfo copyWith({
    String? fullName,
    String? displayName,
    String? username,
    String? email,
    String? secondaryEmail,
    String? phone,
    String? friendshipCode,
    String? profileImageUrl,
  }) {
    return AccountInfo(
      fullName: fullName ?? this.fullName,
      displayName: displayName ?? this.displayName,
      username: username ?? this.username,
      email: email ?? this.email,
      secondaryEmail: secondaryEmail ?? this.secondaryEmail,
      phone: phone ?? this.phone,
      friendshipCode: friendshipCode ?? this.friendshipCode,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}

class EditFieldModel {
  final String label;
  final String value;
  final String? initialValue;

  EditFieldModel({
    required this.label,
    required this.value,
    this.initialValue,
  });
}
