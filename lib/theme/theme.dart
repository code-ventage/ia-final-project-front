import 'package:flutter/material.dart';

final colorSeeds = [
  Colors.blueAccent,
  Colors.orangeAccent,
  Colors.lightGreenAccent,
  Colors.black,
  Colors.purpleAccent,
  Colors.yellowAccent,
];

class CustomTheme {
  late final ThemeData theme;
  final int colorSeed;
  final Brightness brightness;

  CustomTheme({
    this.colorSeed = 0,
    this.brightness = Brightness.light,
  }) : assert(colorSeed >= 0 && colorSeed < colorSeeds.length, 'Color seed must be between 0 and ${colorSeeds.length}.') {
    theme = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorSeeds[colorSeed],
      brightness: brightness,
    );
  }

  CustomTheme copyWith({
    int? colorSeed,
    Brightness? brightness,
  }) {
    return CustomTheme(
      colorSeed: colorSeed ?? this.colorSeed,
      brightness: brightness ?? this.brightness,
    );
  }
}