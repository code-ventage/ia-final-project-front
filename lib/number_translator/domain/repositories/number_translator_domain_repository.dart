import 'package:ia_final_project_front/number_translator/data/data_sources/number_translator_datasource.dart';
import 'package:ia_final_project_front/number_translator/data/models/consult_request.dart';

import '../../data/models/consult_response.dart';
import '../../data/models/general_response.dart';
import '../entities/consult_entity.dart';

abstract class TranslatorDomainRepository {
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultEntity request});
}

class NumberTranslatorDomainRepositoryImpl extends TranslatorDomainRepository {
  final NumberTranslatorDatasource datasource;

  NumberTranslatorDomainRepositoryImpl({required this.datasource});

  @override
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultEntity request}) async => await datasource.makeTranslate(request: ConsultRequest(consult: request.number));
}