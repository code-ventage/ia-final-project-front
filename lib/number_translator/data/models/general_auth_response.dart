class GeneralResponse<T> {
  final String version;
  final Response<T> response;

  GeneralResponse({required this.version, required this.response});

  factory GeneralResponse.fromJson(Map<String, dynamic> json) {
    return GeneralResponse(
      version: json['version'] ?? '',
      response: Response.fromJson(json['response']),
    );
  }
}

class Response<T> {
  final String status;
  final String message;
  final List<T> data;

  Response({required this.status, required this.message, required this.data});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: List.from((json['data'] as List).map((e) => (T is UserScoreResponse) ? UserScoreResponse.fromJson(e) : UserResponse.fromJson(e))),
    );
  }
}

class UserResponse {
  final String username;
  final String password;

  UserResponse({required this.username, required this.password});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      username: json['username'] ?? '',
      password: json['password'] ?? '',
    );
  }
}

class UserScoreResponse {
  final String username;
  final String score;

  UserScoreResponse({required this.username, required this.score});

  factory UserScoreResponse.fromJson(Map<String, dynamic> json) {
    return UserScoreResponse(
      username: json['username'] ?? '',
      score: json['score'] ?? '',
    );
  }
}