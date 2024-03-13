import 'package:ia_final_project_front/config/extension/extensions.dart';

import '../../../data/models/consult_response.dart';
import '../../../data/models/general_response.dart';
import '../../entities/consult_entity.dart';
import '../../repositories/number_translator/number_translator_domain_repository.dart';

abstract class NumberTranslatorService {
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultEntity request, required bool isFromDigit});
}

class NumberTranslatorServiceImpl extends NumberTranslatorService {
  final NumberTranslatorDomainRepository repository;

  NumberTranslatorServiceImpl({required this.repository});

  @override
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultEntity request, required bool isFromDigit}) async {
    var response = await repository.makeTranslate(request: request, isFromDigit: isFromDigit);
    return GeneralResponse(error: response.error, data: ConsultResponse(hashResponse: response.data.hashResponse.formatNumber()));
  }
}