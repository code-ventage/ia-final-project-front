part of 'number_translator_cubit.dart';

abstract class NumberTranslatorState extends Equatable {
  const NumberTranslatorState();

  NumberTranslatorBlocInitial copyWith({
    String? translation,
    int? counter,
  });
}

class NumberTranslatorBlocInitial extends NumberTranslatorState {
  final String translation;
  final int counter;

  const NumberTranslatorBlocInitial({this.translation = "0", this.counter = 0});

  @override
  List<Object> get props => [translation, counter];

  @override
  NumberTranslatorBlocInitial copyWith({
    String? translation,
    int? counter,
  }) {
    return NumberTranslatorBlocInitial(
      translation: translation ?? this.translation,
      counter: counter ?? this.counter,
    );
  }
}