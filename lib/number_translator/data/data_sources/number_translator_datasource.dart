import 'package:ia_final_project_front/number_translator/data/models/consult_response.dart';

import '../models/consult_request.dart';
import '../models/general_response.dart';

abstract class NumberTranslatorDatasource {
  Future<GeneralResponse<ConsultResponse>> makeTranslate({required ConsultRequest request});
}