import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ia_final_project_front/config/config_data/configuration_data.dart';
import 'package:ia_final_project_front/config/connection/connection_helper.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';

part 'configurations_state.dart';

class ConfigurationsCubit extends Cubit<ConfigurationsState> {
  ConfigurationsCubit() : super(const ConfigurationsInitial()){
    currentLanguage = tr("current_language");
  }

  TextEditingController controller = TextEditingController();
  String currentLanguage = 'Espanol';

  void setBaseUrl(String hotspotAddress) async {
    serviceLocator<ConfigurationData>().BASE_URL = 'http://$hotspotAddress:34545';
    serviceLocator.get<ConnectionHelper>().setBaseUrl('http://$hotspotAddress:34545');
    controller.text = hotspotAddress;
    emit(state.copyWith(hotspotAddress: hotspotAddress));
  }

  void changeLanguage(bool spanish) {
    currentLanguage = spanish ? 'es' : 'en';
    emit(state.copyWith(isSpanishLanguage: spanish));
  }
}