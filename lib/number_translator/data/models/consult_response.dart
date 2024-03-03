class ConsultResponse {
  final String hashResponse;

  ConsultResponse({
    required this.hashResponse,
  });

  factory ConsultResponse.fromJson(Map<String, dynamic> json) {
    return ConsultResponse(
      hashResponse: json['hash_response']?['N']??'',
    );
  }
}