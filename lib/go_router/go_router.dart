import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';
import 'package:ia_final_project_front/go_router/routes.dart';
import 'package:ia_final_project_front/number_translator/presentation/pages/configurations/configurations_page.dart';
import 'package:ia_final_project_front/number_translator/presentation/pages/game_page/game_page.dart';

import '../number_translator/presentation/pages/auth/auth_page.dart';
import '../number_translator/presentation/pages/translation/number_translator_page.dart';

final router = GoRouter(
  initialLocation: Routes.authPage.routePath,
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
      pageBuilder: (context, state) => MaterialPage(child: serviceLocator.get<ConfigurationsPage>()),
    ),
    GoRoute(
      path: Routes.gamePage.routePath,
      name: Routes.gamePage.name,
      pageBuilder: (context, state) => MaterialPage(child: serviceLocator.get<GamePage>()),
    ),
    GoRoute(
      path: Routes.authPage.routePath,
      name: Routes.authPage.name,
      pageBuilder: (context, state) => MaterialPage(child: serviceLocator.get<AuthPage>()),
    ),
  ],
);