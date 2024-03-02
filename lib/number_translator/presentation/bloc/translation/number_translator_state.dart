part of 'number_translator_cubit.dart';

abstract class NumberTranslatorState extends Equatable {
  const NumberTranslatorState();

  NumberTranslatorInitial copyWith({
    String? translation,
    int? counter,
  });
}

class NumberTranslatorInitial extends NumberTranslatorState {
  final String translation;
  final int counter;

  const NumberTranslatorInitial({this.translation = "0", this.counter = 0});

  @override
  List<Object> get props => [translation, counter];

  @override
  NumberTranslatorInitial copyWith({
    String? translation,
    int? counter,
  }) {
    return NumberTranslatorInitial(
      translation: translation ?? this.translation,
      counter: counter ?? this.counter,
    );
  }
}