import 'package:get_it/get_it.dart';
import 'package:ia_final_project_front/config/conection/connection_helper.dart';
import 'package:ia_final_project_front/config/config_data/configuration_data.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/number_translator_cubit.dart';

import '../../number_translator/data/repositories/number_translator_repository.dart';
import '../../number_translator/presentation/pages/number_translator_page.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton(() => const NumberTranslatorPage());
  serviceLocator.registerLazySingleton(() => NumberTranslatorRepository());
  serviceLocator.registerLazySingleton(() => const ConfigurationData());
  serviceLocator.registerLazySingleton(() => ConnectionHelper());
  serviceLocator.registerLazySingleton(() => NumberTranslatorCubit());
}