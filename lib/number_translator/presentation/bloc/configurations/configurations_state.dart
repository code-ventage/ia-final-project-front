part of 'configurations_cubit.dart';

abstract class ConfigurationsState extends Equatable {
  const ConfigurationsState();

  ConfigurationsInitial copyWith({String? baseUrl});
}

class ConfigurationsInitial extends ConfigurationsState {
  final String baseUrl;

  const ConfigurationsInitial(
      {this.baseUrl = '192.168.43.9'});

  @override
  ConfigurationsInitial copyWith({String? baseUrl}) {
    return ConfigurationsInitial(
        baseUrl: baseUrl ?? this.baseUrl);
  }

  @override
  List<Object> get props => [baseUrl];
}
