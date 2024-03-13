part of 'theme_selector_cubit.dart';

abstract class ThemeSelectorState extends Equatable {
  const ThemeSelectorState();

  ThemeSelectorState copyWith({
    ThemeMode? themeMode,
    int? colorSeed,
  });
}

class ThemeSelectorInitial extends ThemeSelectorState {
  final ThemeMode themeMode;
  final int colorSeed;

  const ThemeSelectorInitial({
    this.themeMode = ThemeMode.dark,
    this.colorSeed = 0,
  });

  @override
  ThemeSelectorInitial copyWith({
    ThemeMode? themeMode,
    int? colorSeed,
  }) {
    return ThemeSelectorInitial(
      themeMode: themeMode ?? this.themeMode,
      colorSeed: colorSeed ?? this.colorSeed,
    );
  }

  @override
  List<Object> get props => [themeMode, colorSeed];
}