enum UserRoles {
  user(value: 'USER'),
  admin(value: 'ADMIN');

  const UserRoles({required this.value});

  final String value;

  static UserRoles fromString(String value) {
    switch (value.toLowerCase()) {
      case 'admin':
        return UserRoles.admin;
      default:
        return UserRoles.user;
    }
  }
}
