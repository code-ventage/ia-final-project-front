class ConsultRequest {
  final String consult;
  
  ConsultRequest({
    required this.consult,
  });
  
  Map<String, dynamic> toJson() {
    return {
      "consult": consult,
    };
  }
}