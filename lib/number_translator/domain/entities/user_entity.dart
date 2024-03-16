class UserEntity {
  final String username;
  final String password;

  const UserEntity({
    required this.username,
    required this.password,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      username: json['username'] ?? '',
      password: json['password'] ?? '',
    );
  }
}