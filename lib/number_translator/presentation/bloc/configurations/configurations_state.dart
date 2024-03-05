part of 'configurations_cubit.dart';

abstract class ConfigurationsState extends Equatable {
  const ConfigurationsState();

  ConfigurationsInitial copyWith({String? hotspotAddress, bool? isSpanishLanguaje});
}

class ConfigurationsInitial extends ConfigurationsState {
  final String hotspotAddress;
  final bool isSpanishLanguaje;

  const ConfigurationsInitial({this.hotspotAddress = '192.168.43.9', this.isSpanishLanguaje = true});

  @override
  ConfigurationsInitial copyWith({String? hotspotAddress, bool? isSpanishLanguaje}) {
    return ConfigurationsInitial(
      hotspotAddress: hotspotAddress ?? this.hotspotAddress,
      isSpanishLanguaje: isSpanishLanguaje ?? this.isSpanishLanguaje,
    );
  }

  @override
  List<Object> get props => [hotspotAddress, isSpanishLanguaje];
}