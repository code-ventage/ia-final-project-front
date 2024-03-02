import 'package:flutter/cupertino.dart';
import 'package:ia_final_project_front/config/connection/connection_helper.dart';
import 'package:ia_final_project_front/config/service_locator/get_it.dart';
import 'package:ia_final_project_front/number_translator/data/models/consult_request.dart';
import 'package:ia_final_project_front/number_translator/data/models/consult_response.dart';
import 'package:ia_final_project_front/number_translator/data/models/general_response.dart';

class NumberTranslatorRepository {
  final connectionHelper = serviceLocator.get<ConnectionHelper>();

  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultRequest request}) async {
    var response = <String, String>{};
    var error = '';
    try {
      response = await connectionHelper.dio.post(
        '/consult',
        data: request.toJson(),
      ) as Map<String, String>;
    } on Exception catch (e) {
      debugPrint(e.toString());
      error = e.toString();
    }
    return GeneralResponse(error: error, data: ConsultResponse.fromJson(response));
  }
}