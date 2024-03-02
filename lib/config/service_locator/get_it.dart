import 'package:get_it/get_it.dart';
import 'package:ia_final_project_front/config/config_data/configuration_data.dart';
import 'package:ia_final_project_front/config/connection/connection_helper.dart';
import 'package:ia_final_project_front/number_translator/data/repositories/number_translator_repository.dart';
import 'package:ia_final_project_front/number_translator/domain/use_cases/number_translator_service.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/translation/number_translator_cubit.dart';

import '../../number_translator/data/data_sources/number_translator_datasource.dart';
import '../../number_translator/domain/repositories/number_translator_domain_repository.dart';
import '../../number_translator/presentation/pages/translation/number_translator_page.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerSingleton<ConfigurationData>(const ConfigurationData(DEBUGING: true));
  serviceLocator.registerSingleton<ConnectionHelper>(ConnectionHelper());
  serviceLocator.registerSingleton<NumberTranslatorCubit>(NumberTranslatorCubit());

  setupDataServices();
  setupDomainServices();

  setupPages();
}

void setupPages() {
  serviceLocator.registerSingleton<NumberTranslatorPage>(const NumberTranslatorPage());
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