import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:network_info_plus/network_info_plus.dart';

part 'configurations_state.dart';

class ConfigurationsCubit extends Cubit<ConfigurationsState> {
  ConfigurationsCubit() : super(const ConfigurationsInitial());

  void getIP() async {
    emit(state.copyWith(wifiIp: await NetworkInfo().getWifiIP()));
  }
}
