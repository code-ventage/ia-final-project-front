import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/config/service_locator/get_it.dart';
import 'package:ia_final_project_front/go_router/routes.dart';
import 'package:ia_final_project_front/number_translator/presentation/pages/configurations/base_url_page.dart';
import 'package:ia_final_project_front/number_translator/presentation/pages/configurations/configurations_page.dart';

import '../number_translator/presentation/pages/translation/number_translator_page.dart';

final router = GoRouter(
  initialLocation: Routes.numberTranslator.routePath,
  routes: [
    GoRoute(
      path: Routes.numberTranslator.routePath,
      name: Routes.numberTranslator.name,
      pageBuilder: (context, state) => MaterialPage(
        child: serviceLocator.get<NumberTranslatorPage>(),
      ),
    ),
    GoRoute(
      path: Routes.configurations.routePath,
      name: Routes.configurations.name,
      pageBuilder: (context, state) => MaterialPage(
          child: serviceLocator.get<ConfigurationsPage>()
      ),
      routes: [
        GoRoute(
          path: Routes.baseUrl.routePath,
          name: Routes.baseUrl.name,
          pageBuilder: (context, state) => MaterialPage(
            child: serviceLocator.get<BaseUrlPage>()
          ),
        )
      ]
    )
  ],
);
