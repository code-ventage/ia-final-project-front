class UserScoreModel {
  final String username;
  final String score;

  UserScoreModel({
    required this.username,
    required this.score,
  });

  factory UserScoreModel.fromJson(Map<String, dynamic> json) {
    return UserScoreModel(
      username: json['username'] ?? '',
      score: json['score'] ?? '',
    );
  }
}