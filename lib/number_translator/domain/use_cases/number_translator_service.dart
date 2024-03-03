import '../../data/models/consult_response.dart';
import '../../data/models/general_response.dart';
import '../entities/consult_entity.dart';
import '../repositories/number_translator_domain_repository.dart';

abstract class NumberTranslatorService {
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultEntity request});
}

class NumberTranslatorServiceImpl extends NumberTranslatorService {
  final NumberTranslatorDomainRepository repository;

  NumberTranslatorServiceImpl({required this.repository});

  @override
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultEntity request}) async => await repository.makeTranslate(request: request);
}