part of 'number_translator_cubit.dart';

abstract class NumberTranslatorState extends Equatable {
  const NumberTranslatorState();

  NumberTranslatorInitial copyWith({
    String? translation,
    bool? validationFailed,
    bool? isDigitTranslationSelected,
  });
}

class NumberTranslatorInitial extends NumberTranslatorState {
  final String translation;
  final bool validationFailed;
  final bool isLetterTranslationSelected;

  const NumberTranslatorInitial({
    this.translation = "",
    this.validationFailed = false,
    this.isLetterTranslationSelected = false,
  });

  @override
  List<Object> get props => [translation, validationFailed, isLetterTranslationSelected];

  @override
  NumberTranslatorInitial copyWith({
    String? translation,
    int? counter,
    bool? validationFailed,
    bool? isDigitTranslationSelected,
  }) {
    return NumberTranslatorInitial(
      translation: translation ?? this.translation,
      validationFailed: validationFailed?? this.validationFailed,
      isLetterTranslationSelected: isDigitTranslationSelected?? isLetterTranslationSelected,
    );
  }
}