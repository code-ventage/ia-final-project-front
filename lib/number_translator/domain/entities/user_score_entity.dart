class UserScoreEntity {
  final String username;
  final String score;
  final String date;

  UserScoreEntity({
    required this.username,
    required this.score,
    required this.date,
  });

  factory UserScoreEntity.fromJson(Map<String, dynamic> json) {
    return UserScoreEntity(
      username: json['username'] ?? '',
      score: json['score'] ?? '',
      date: json['date'] ?? '',
    );
  }
}