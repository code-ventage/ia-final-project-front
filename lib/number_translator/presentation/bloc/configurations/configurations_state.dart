part of 'configurations_cubit.dart';

abstract class ConfigurationsState extends Equatable {
  const ConfigurationsState();

  ConfigurationsInitial copyWith({String? baseUrl});
}

class ConfigurationsInitial extends ConfigurationsState {
  final String hotspotAddress;

  const ConfigurationsInitial(
      {this.hotspotAddress = '192.168.43.9'});

  @override
  ConfigurationsInitial copyWith({String? baseUrl}) {
    return ConfigurationsInitial(
        hotspotAddress: baseUrl ?? hotspotAddress);
  }

  @override
  List<Object> get props => [hotspotAddress];
}