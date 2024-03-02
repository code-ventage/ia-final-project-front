import 'package:ia_final_project_front/config/conection/connection_helper.dart';
import 'package:ia_final_project_front/config/service_locator/get_it.dart';

class NumberTranslatorRepository {
  final connectionHelper = serviceLocator.get<ConnectionHelper>();

  Future<String> makeTranslate() async {
    return (await connectionHelper.dio.post(
      '/consult',
      data: {
        "consult": "mil dos",
      },
    ) as Map)['hash_response'];
  }
}