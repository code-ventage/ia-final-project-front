import 'package:ia_final_project_front/number_translator/data/models/consult_request.dart';
import 'package:ia_final_project_front/number_translator/data/repositories/number_translator/number_translator_repository.dart';

import '../../../data/models/consult_response.dart';
import '../../../data/models/general_response.dart';
import '../../entities/consult_entity.dart';

abstract class NumberTranslatorDomainRepository {
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultEntity request, required bool isFromDigit});
}

class NumberTranslatorDomainRepositoryImpl extends NumberTranslatorDomainRepository {
  final NumberTranslatorRepository repository;

  NumberTranslatorDomainRepositoryImpl({required this.repository});

  @override
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultEntity request, required bool isFromDigit}) async =>
      await repository.makeTranslate(
        request: ConsultRequest(consult: request.number),
        isFromDigit: isFromDigit,
      );
}