class UserScoreModel {
  final String username;
  final String score;
  final String date;

  UserScoreModel({
    required this.username,
    required this.score,
    required this.date,
  });

  factory UserScoreModel.fromJson(Map<String, dynamic> json) {
    return UserScoreModel(
      username: json['username'] ?? '',
      score: json['score'] ?? '',
      date: json['date'] ?? '',
    );
  }

  Map<String, String> toJson() {
    return {
      'username': username,
      'score': score,
      'date': date,
    };
  }
}