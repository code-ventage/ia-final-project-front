import 'package:flutter/cupertino.dart';
import 'package:ia_final_project_front/number_translator/data/models/consult_response.dart';

import '../../../config/config_data/configuration_data.dart';
import '../../../config/connection/connection_helper.dart';
import '../../../config/service_locator/service_locator.dart';
import '../models/consult_request.dart';
import '../models/general_response.dart';

abstract class NumberTranslatorDatasource {
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultRequest request, required bool isFromDigit});
}

class NumberTranslatorDatasourceImpl extends NumberTranslatorDatasource {
  final ConnectionHelper connectionHelper;

  NumberTranslatorDatasourceImpl({required this.connectionHelper});

  @override
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultRequest request, required bool isFromDigit}) async {
    var response = <String, dynamic>{};
    var error = '';
    try {
      if (serviceLocator.get<ConfigurationData>().DEBUGING) {
        response = {
          'hash_response': {'N': isFromDigit ? '123456' : 'mil doscientos'},
        };
        return GeneralResponse(error: error, data: ConsultResponse.fromJson(response));
      }
      debugPrint('baseUrl: ${connectionHelper.dio.options.baseUrl}');
      response = (await connectionHelper.dio.post(
        '/consult/${isFromDigit ? '/digit' : '/letter'}',
        data: request.toJson(),
      ))
          .data;
      error = 'false';
    } on Exception catch (e) {
      debugPrint(e.toString());
      error = 'true';
    }
    return GeneralResponse(error: error, data: ConsultResponse.fromJson(response));
  }
}