class ConsultRequest {
  final String consult;
  
  ConsultRequest({
    required this.consult,
  });
  
  //toLson
  Map<String, dynamic> toJson() {
    return {
      "consult": consult,
    };
  }
}