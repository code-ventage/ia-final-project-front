part of 'number_translator_cubit.dart';

abstract class NumberTranslatorBlocState extends Equatable {
  const NumberTranslatorBlocState();

  NumberTranslatorBlocState copyWith({required String translation});
}

class NumberTranslatorBlocInitial extends NumberTranslatorBlocState {
  final String translation;

  const NumberTranslatorBlocInitial({this.translation = ""});

  @override
  List<Object> get props => [translation];

  @override
  NumberTranslatorBlocInitial copyWith({
    String? translation,
  }) {
    return NumberTranslatorBlocInitial(
      translation: translation ?? this.translation,
    );
  }
}