import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'configurations_state.dart';

class ConfigurationsCubit extends Cubit<ConfigurationsState> {
  ConfigurationsCubit() : super(const ConfigurationsInitial());
}
