import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ia_final_project_front/config/config_data/configuration_data.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';

part 'configurations_state.dart';

class ConfigurationsCubit extends Cubit<ConfigurationsState> {
  ConfigurationsCubit() : super(const ConfigurationsInitial());

  TextEditingController controller = TextEditingController();

  void setBaseUrl(String hotspotAddress) async {
    serviceLocator<ConfigurationData>().BASE_URL = 'http://$hotspotAddress:34545';
    controller.text = hotspotAddress;
    emit(state.copyWith(hotspotAddress: hotspotAddress));
  }
}