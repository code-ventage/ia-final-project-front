import 'package:ia_final_project_front/number_translator/data/models/consult_request.dart';
import 'package:ia_final_project_front/number_translator/data/models/consult_response.dart';
import 'package:ia_final_project_front/number_translator/data/models/general_response.dart';

import '../../data_sources/number_translator/number_translator_datasource.dart';

abstract class NumberTranslatorRepository {
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultRequest request, required bool isFromDigit});
}

class NumberTranslatorRepositoryImpl extends NumberTranslatorRepository {
  final NumberTranslatorDatasource datasource;

  NumberTranslatorRepositoryImpl({required this.datasource});

  @override
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultRequest request, required bool isFromDigit}) async =>
      await datasource.makeTranslate(
        request: request,
        isFromDigit: isFromDigit,
      );
}