import 'package:ia_final_project_front/number_translator/data/models/consult_request.dart';
import 'package:ia_final_project_front/number_translator/data/models/consult_response.dart';
import 'package:ia_final_project_front/number_translator/data/models/general_response.dart';

abstract class NumberTranslatorRepository {
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultRequest request});
}