import 'package:flutter/cupertino.dart';
import 'package:ia_final_project_front/number_translator/data/models/consult_response.dart';

import '../../../config/connection/connection_helper.dart';
import '../models/consult_request.dart';
import '../models/general_response.dart';

abstract class NumberTranslatorDatasource {
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultRequest request});
}


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