part of 'number_translator_cubit.dart';

abstract class NumberTranslatorState extends Equatable {
  const NumberTranslatorState();

  NumberTranslatorInitial copyWith({
    bool? validationFailed,
    bool? isDigitTranslationSelected,
  });
}

class NumberTranslatorInitial extends NumberTranslatorState {
  final bool validationFailed;
  final bool isLetterTranslation;

  const NumberTranslatorInitial({
    this.validationFailed = false,
    this.isLetterTranslation = false,
  });

  @override
  List<Object> get props => [validationFailed, isLetterTranslation];

  @override
  NumberTranslatorInitial copyWith({
    int? counter,
    bool? validationFailed,
    bool? isDigitTranslationSelected,
  }) {
    return NumberTranslatorInitial(
      validationFailed: validationFailed?? this.validationFailed,
      isLetterTranslation: isDigitTranslationSelected?? isLetterTranslation,
    );
  }
}