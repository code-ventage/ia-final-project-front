import 'package:get_it/get_it.dart';
import 'package:ia_final_project_front/config/config_data/configuration_data.dart';
import 'package:ia_final_project_front/config/connection/connection_helper.dart';
import 'package:ia_final_project_front/number_translator/data/repositories/number_translator/number_translator_repository.dart';
import 'package:ia_final_project_front/number_translator/domain/use_cases/number_translator/number_translator_service.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/configurations/configurations_cubit.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/translation/number_translator_cubit.dart';
import 'package:ia_final_project_front/number_translator/presentation/pages/configurations/configurations_page.dart';
import 'package:ia_final_project_front/number_translator/presentation/pages/game_page/game_page.dart';
import 'package:ia_final_project_front/theme/presentation/bloc/theme_selector_cubit.dart';

import '../../number_translator/data/data_sources/number_translator/number_translator_datasource.dart';
import '../../number_translator/domain/repositories/number_translator/number_translator_domain_repository.dart';
import '../../number_translator/presentation/bloc/game/game_cubit.dart';
import '../../number_translator/presentation/pages/translation/number_translator_page.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingleton<ConfigurationData>(ConfigurationData());
  serviceLocator.registerSingleton<ConnectionHelper>(ConnectionHelper());
  serviceLocator.registerSingleton<NumberTranslatorCubit>(NumberTranslatorCubit());
  serviceLocator.registerSingleton<ConfigurationsCubit>(ConfigurationsCubit());
  serviceLocator.registerSingleton<GameCubit>(GameCubit());
  serviceLocator.registerSingleton<ThemeSelectorCubit>(ThemeSelectorCubit());


  setupDataServices();
  setupDomainServices();

  setupPages();
}

void setupPages() {
  serviceLocator.registerSingleton<NumberTranslatorPage>(const NumberTranslatorPage());
  serviceLocator.registerSingleton<ConfigurationsPage>(const ConfigurationsPage());
  serviceLocator.registerSingleton<GamePage>(const GamePage());
}

void setupDataServices() {
  serviceLocator.registerSingleton<NumberTranslatorDatasource>(
    NumberTranslatorDatasourceImpl(
      connectionHelper: serviceLocator.get<ConnectionHelper>(),
    ),
  );

  serviceLocator.registerSingleton<NumberTranslatorRepository>(
    NumberTranslatorRepositoryImpl(datasource: serviceLocator.get<NumberTranslatorDatasource>()),
  );
}

void setupDomainServices() {
  serviceLocator.registerSingleton<NumberTranslatorDomainRepository>(
    NumberTranslatorDomainRepositoryImpl(repository: serviceLocator.get<NumberTranslatorRepository>()),
  );

  serviceLocator.registerSingleton<NumberTranslatorService>(
    NumberTranslatorServiceImpl(
      repository: serviceLocator.get<NumberTranslatorDomainRepository>(),
    ),
  );
}