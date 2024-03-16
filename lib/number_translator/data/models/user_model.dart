class UserModel {
  final String username;
  final String password;

  const UserModel({
    required this.username,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, String> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}