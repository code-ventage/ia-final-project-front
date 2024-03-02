part of 'number_translator_cubit.dart';

abstract class NumberTranslatorState extends Equatable {
  const NumberTranslatorState();

  NumberTranslatorInitial copyWith({
    String? translation,
    bool? validationFailed,
  });
}

class NumberTranslatorInitial extends NumberTranslatorState {
  final String translation;
  final bool validationFailed;

  const NumberTranslatorInitial({
    this.translation = "",
    this.validationFailed = false,
  });

  @override
  List<Object> get props => [translation, validationFailed];

  @override
  NumberTranslatorInitial copyWith({
    String? translation,
    int? counter,
    bool? validationFailed,
  }) {
    return NumberTranslatorInitial(
      translation: translation ?? this.translation,
      validationFailed: validationFailed?? this.validationFailed,
    );
  }
}