import 'package:flutter/cupertino.dart';

class GeneralUsersResponse<T> {
  final String version;
  final Response<T> response;

  GeneralUsersResponse({required this.version, required this.response});

  factory GeneralUsersResponse.fromJson(Map<String, dynamic> json, bool isUserScore) {
    return GeneralUsersResponse(
      version: json['version'] ?? '',
      response: Response<T>.fromJson(json['response'], isUserScore),
    );
  }
}

class Response<T> {
  final String status;
  final String message;
  final List<T> data;

  Response({required this.status, required this.message, required this.data});

  factory Response.fromJson(Map<String, dynamic> json, bool isUsersScore) {
    return Response(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: List.from((json['data'] as List).map((e) => (isUsersScore) ? UserScoreResponse.fromJson(e) : UserResponse.fromJson(e))),
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
  final String date;

  UserScoreResponse({required this.username, required this.score, required this.date});

  factory UserScoreResponse.fromJson(Map<String, dynamic> json) {
    return UserScoreResponse(
      username: json['username'] ?? '',
      score: json['score'] ?? '',
      date: json['date'] ?? '',
    );
  }
}