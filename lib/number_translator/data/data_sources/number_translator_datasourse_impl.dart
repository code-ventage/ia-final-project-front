
import 'package:flutter/material.dart';

import '../../../config/connection/connection_helper.dart';
import '../models/consult_request.dart';
import '../models/consult_response.dart';
import '../models/general_response.dart';
import 'number_translator_datasource.dart';

class NumberTranslatorDatasourceImpl extends NumberTranslatorDatasource{


  final ConnectionHelper connectionHelper;

  NumberTranslatorDatasourceImpl({required this.connectionHelper});

  @override
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