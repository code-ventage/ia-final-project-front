part of 'configurations_cubit.dart';

abstract class ConfigurationsState extends Equatable {
  const ConfigurationsState();

  ConfigurationsInitial copyWith({String? baseUrl, String? wifiIp});
}

class ConfigurationsInitial extends ConfigurationsState {
  final String baseUrl;
  final String wifiIp;

  const ConfigurationsInitial(
      {this.baseUrl = '0.0.0.0', this.wifiIp = '192.168.43.9'});

  @override
  ConfigurationsInitial copyWith({String? baseUrl, String? wifiIp}) {
    return ConfigurationsInitial(
        baseUrl: baseUrl ?? this.baseUrl, wifiIp: wifiIp ?? this.wifiIp);
  }

  @override
  List<Object> get props => [baseUrl, wifiIp];
}
