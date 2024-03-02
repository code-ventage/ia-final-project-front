import 'package:ia_final_project_front/number_translator/data/data_sources/number_translator_datasourse_impl.dart';
import 'package:ia_final_project_front/number_translator/data/models/consult_request.dart';
import 'package:ia_final_project_front/number_translator/data/models/consult_response.dart';
import 'package:ia_final_project_front/number_translator/data/models/general_response.dart';

import 'number_translator_repository.dart';

class NumberTranslatorRepositoryImpl extends NumberTranslatorRepository{

  final NumberTranslatorDatasourceImpl datasource;

  NumberTranslatorRepositoryImpl({required this.datasource});

  @override
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultRequest request}) async => await datasource.makeTranslate(request: request);

}