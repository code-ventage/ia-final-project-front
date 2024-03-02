import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ia_final_project_front/config/service_locator/get_it.dart';
import 'package:ia_final_project_front/number_translator/domain/entities/consult_entity.dart';
import 'package:ia_final_project_front/number_translator/domain/use_cases/number_translator_service.dart';

part 'number_translator_state.dart';

class NumberTranslatorCubit extends Cubit<NumberTranslatorState> {
  NumberTranslatorCubit() : super(const NumberTranslatorInitial());
  final String translation = "";
  final TextEditingController numberToTranslateController = TextEditingController();
  final TextEditingController translatedNumberController = TextEditingController();

  Future<void> translate({required String numberToTranslate}) async {
    var response = await serviceLocator.get<NumberTranslatorService>().makeTranslate(request: ConsultEntity(number: numberToTranslate));
    if (response.error == 'true') {
      emit(
        state.copyWith(
          validationFailed: true,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        translation:
            (await serviceLocator.get<NumberTranslatorService>().makeTranslate(request: ConsultEntity(number: numberToTranslate))).data.hashResponse,
        validationFailed: false,
      ),
    );
  }

  Future<bool> validateNumberToTranslate() async {
    if (numberToTranslateController.text.isEmpty) {
      emit(
        state.copyWith(
          validationFailed: true,
        ),
      );
      return true;
    }
    final Map<String, dynamic> numbersMapping = jsonDecode(await rootBundle.loadString('assets/numbers/numbers-mapping.json'));
    for( var element in numberToTranslateController.text.split(' ')){
      if (!numbersMapping['numbers']!.contains(element)) {
        emit(
          state.copyWith(
            validationFailed: true,
          ),
        );
        return false;
      }
    }
    emit(
      state.copyWith(
        validationFailed: false,
      ),
    );
    return true;
  }
}