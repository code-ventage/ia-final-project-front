import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ia_final_project_front/config/config_data/configuration_data.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';

part 'configurations_state.dart';

class ConfigurationsCubit extends Cubit<ConfigurationsState> {
  ConfigurationsCubit() : super(const ConfigurationsInitial());

  TextEditingController controller = TextEditingController();

  void setBaseUrl(String baseUrl) async {
    serviceLocator<ConfigurationData>().BASE_URL = baseUrl;
    controller.text = baseUrl;
    emit(state.copyWith(baseUrl: baseUrl));
  }
}