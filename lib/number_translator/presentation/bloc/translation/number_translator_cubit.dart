import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';
import 'package:ia_final_project_front/number_translator/domain/entities/consult_entity.dart';
import 'package:ia_final_project_front/number_translator/domain/use_cases/number_translator_service.dart';

part 'number_translator_state.dart';

class NumberTranslatorCubit extends Cubit<NumberTranslatorState> {
  NumberTranslatorCubit() : super(const NumberTranslatorInitial());
  final String translation = "";
  final TextEditingController numberToTranslateController = TextEditingController();
  final TextEditingController translatedNumberController = TextEditingController();

  Future<void> translate({required String numberToTranslate}) async {
    final errorTextToShow = tr('insert_a_valid_number_to_translate');
    var response = await serviceLocator.get<NumberTranslatorService>().makeTranslate(request: ConsultEntity(number: numberToTranslate));
    if (response.error == 'true') {
      emit(
        state.copyWith(
          translation: '',
          validationFailed: true,
        ),
      );
      return;
    }
    String? hashResponse = response.data.hashResponse;
    if(hashResponse.isEmpty){
      emit(
        state.copyWith(
          translation: errorTextToShow,
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
    final errorTextToShow = tr('insert_a_valid_number_to_translate');
    final insertTextToShow = tr('insert_some_value_to_translate');
    if (numberToTranslateController.text.isEmpty) {
      emit(
        state.copyWith(
          translation: insertTextToShow,
          validationFailed: false,
        ),
      );
      return false;
    }
    final Map<String, dynamic> numbersMapping = jsonDecode(await rootBundle.loadString('assets/numbers/numbers-mapping.json'));
    for( var element in numberToTranslateController.text.trim().split(' ')){
      if (!numbersMapping['numbers']!.contains(element)) {
        emit(
          state.copyWith(
            translation: errorTextToShow,
            validationFailed: true,
          ),
        );
        return false;
      }
    }
    emit(
      state.copyWith(
        translation: errorTextToShow,
        validationFailed: false,
      ),
    );
    return true;
  }
}