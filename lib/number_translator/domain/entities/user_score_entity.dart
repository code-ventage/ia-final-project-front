class UserScoreEntity {
  final String username;
  final String score;

  UserScoreEntity({
    required this.username,
    required this.score,
  });

  factory UserScoreEntity.fromJson(Map<String, dynamic> json) {
    return UserScoreEntity(
      username: json['username'] ?? '',
      score: json['score'] ?? '',
    );
  }
}