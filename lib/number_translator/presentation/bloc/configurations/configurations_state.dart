part of 'configurations_cubit.dart';

abstract class ConfigurationsState extends Equatable {
  const ConfigurationsState();
}

class ConfigurationsInitial extends ConfigurationsState {
  final String baseUrl;

  const ConfigurationsInitial({
    this.baseUrl = '0.0.0.0'
  });
  
  @override
  ConfigurationsInitial copyWith({
    String? baseUrl
  }) {
    return ConfigurationsInitial(
        baseUrl: baseUrl ?? this.baseUrl
    );
}

  @override
  List<Object> get props => [];
}
