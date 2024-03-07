part of 'configurations_cubit.dart';

abstract class ConfigurationsState extends Equatable {
  const ConfigurationsState();

  ConfigurationsInitial copyWith({String? hotspotAddress, bool? isSpanishLanguage});
}

class ConfigurationsInitial extends ConfigurationsState {
  final String hotspotAddress;
  final bool isSpanishLanguage;

  const ConfigurationsInitial({this.hotspotAddress = '0.0.0.0', this.isSpanishLanguage = true});

  @override
  ConfigurationsInitial copyWith({String? hotspotAddress, bool? isSpanishLanguage}) {
    return ConfigurationsInitial(
      hotspotAddress: hotspotAddress ?? this.hotspotAddress,
      isSpanishLanguage: isSpanishLanguage ?? this.isSpanishLanguage,
    );
  }

  @override
  List<Object> get props => [hotspotAddress, isSpanishLanguage];
}