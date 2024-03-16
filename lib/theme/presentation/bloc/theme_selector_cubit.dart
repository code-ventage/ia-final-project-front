import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_selector_state.dart';

class ThemeSelectorCubit extends Cubit<ThemeSelectorState> {
  ThemeSelectorCubit() : super(const ThemeSelectorInitial());

  void changeTheme(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  void changeColorSeed(int colorSeed) {
    emit(state.copyWith(colorSeed: colorSeed));
  }
}