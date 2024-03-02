import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'number_translator_state.dart';

class NumberTranslatorCubit extends Cubit<NumberTranslatorState> {
  NumberTranslatorCubit() : super(const NumberTranslatorBlocInitial());
  final String translation = "";

  // translate
  Future<void> translate({required String translate}) async {
    emit(state.copyWith(translation: translate));
  }

  // counter
  Future<void> counter({required int counter}) async {
    emit(state.copyWith(counter: counter));
  }

}