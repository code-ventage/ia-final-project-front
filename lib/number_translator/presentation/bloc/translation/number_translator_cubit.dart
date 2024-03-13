import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';
import 'package:ia_final_project_front/number_translator/domain/entities/consult_entity.dart';
import 'package:ia_final_project_front/number_translator/domain/use_cases/number_translator/number_translator_service.dart';

part 'number_translator_state.dart';

class NumberTranslatorCubit extends Cubit<NumberTranslatorState> {
  NumberTranslatorCubit() : super(const NumberTranslatorInitial()) {
    translatedNumberController.text = tr('insert_a_valid_number_to_translate');
  }

  final String translation = "";
  final TextEditingController numberToTranslateController = TextEditingController();
  final TextEditingController translatedNumberController = TextEditingController();

  Future<void> translate({required String numberToTranslate}) async {
    final errorTextToShow = tr('insert_a_valid_number_to_translate');
    var response = await serviceLocator.get<NumberTranslatorService>().makeTranslate(
          request: ConsultEntity(number: numberToTranslate),
          isFromDigit: (state as NumberTranslatorInitial).isLetterTranslation,
        );
    if (response.error == 'true') {
      translatedNumberController.text = '';
      emit(
        state.copyWith(
          validationFailed: true,
        ),
      );
      return;
    }
    String hashResponse = response.data.hashResponse;
    if (hashResponse.isEmpty) {
      translatedNumberController.text = errorTextToShow;
      emit(
        state.copyWith(
          validationFailed: true,
        ),
      );
      return;
    }
    translatedNumberController.text = hashResponse;
    emit(
      state.copyWith(
        validationFailed: false,
      ),
    );
  }

  Future<bool> validateNumberToTranslate() async {
    final errorTextToShow = tr('insert_a_valid_number_to_translate');
    final insertTextToShow = tr('insert_some_value_to_translate');
    if (numberToTranslateController.text.isEmpty) {
      translatedNumberController.text = insertTextToShow;
      emit(
        state.copyWith(
          validationFailed: false,
        ),
      );
      return false;
    }
    var isOnlyDigits = numberToTranslateController.text.trim().split(' ').every((element) => int.tryParse(element) != null);
    if (!(state as NumberTranslatorInitial).isLetterTranslation && !isOnlyDigits) {
      translatedNumberController.text = errorTextToShow;
      emit(
        state.copyWith(
          validationFailed: true,
        ),
      );
      return false;
    }
    if (!(state as NumberTranslatorInitial).isLetterTranslation) {
      translatedNumberController.text = '';
      emit(
        state.copyWith(
          validationFailed: false,
        ),
      );
      return true;
    }
    final Map<String, dynamic> numbersMapping = jsonDecode(await rootBundle.loadString('assets/numbers/numbers-mapping.json'));
    for (var element in numberToTranslateController.text.trim().split(' ')) {
      if (!numbersMapping['numbers']!.contains(element)) {
        translatedNumberController.text = errorTextToShow;
        emit(
          state.copyWith(
            validationFailed: true,
          ),
        );
        return false;
      }
    }
    translatedNumberController.text = errorTextToShow;
    emit(
      state.copyWith(
        validationFailed: false,
      ),
    );
    return true;
  }

  void changeTranslationType() {
    numberToTranslateController.text = '';
    translatedNumberController.text = '';
    emit(
      state.copyWith(
        isDigitTranslationSelected: !(state as NumberTranslatorInitial).isLetterTranslation,
      ),
    );
  }
}