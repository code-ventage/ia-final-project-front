import 'package:get_it/get_it.dart';
import 'package:ia_final_project_front/config/config_data/configuration_data.dart';
import 'package:ia_final_project_front/config/connection/connection_helper.dart';
import 'package:ia_final_project_front/number_translator/data/data_sources/number_translator_datasourse_impl.dart';
import 'package:ia_final_project_front/number_translator/data/repositories/number_translator_repository.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/number_translator_cubit.dart';
import 'package:ia_final_project_front/number_translator/presentation/pages/configurations/configurations_page.dart';

import '../../number_translator/data/data_sources/number_translator_datasource.dart';
import '../../number_translator/data/repositories/number_translator_repository_impl.dart';
import '../../number_translator/presentation/pages/number_translator_page.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingleton<ConfigurationData>(const ConfigurationData());
  serviceLocator.registerSingleton<ConnectionHelper>(ConnectionHelper());
  serviceLocator.registerSingleton<NumberTranslatorCubit>(NumberTranslatorCubit());

  setupDataServices();

  setupPages();
}

void setupPages() {
  serviceLocator.registerSingleton<NumberTranslatorPage>(const NumberTranslatorPage());
  serviceLocator.registerSingleton<ConfigurationsPage>(const ConfigurationsPage());
}

void setupDataServices() {
  serviceLocator.registerSingleton<NumberTranslatorDatasource>(
    NumberTranslatorDatasourceImpl(
      connectionHelper: serviceLocator.get<ConnectionHelper>(),
    ),
  );
  
  serviceLocator.registerSingleton<NumberTranslatorRepository>(
    NumberTranslatorRepositoryImpl(
      datasource: serviceLocator.get<NumberTranslatorDatasourceImpl>()
    ),
  );
}