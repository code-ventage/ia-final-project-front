import 'package:dio/dio.dart';

class NumberTranslatorRepository {
  final dio = Dio(BaseOptions(
    baseUrl: 'http://0.0.0.0:34545',
    contentType: 'application/json',
  ));

  Future<String> makeTranslate() async {
    return (await dio.post(
      '/consult',
      data: {
        "consult": "mil dos",
      },
    ) as Map)['hash_response'];
  }
}