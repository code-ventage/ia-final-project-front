import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/configurations/configurations_cubit.dart';

import 'config/service_locator/service_locator.dart';
import 'go_router/go_router.dart';
import 'number_translator/presentation/bloc/translation/number_translator_cubit.dart';

void main() async {
  initServices();

  runApp(const NumberTranslateApp());
}

void initServices() {
  setupServiceLocator();
}

class NumberTranslateApp extends StatelessWidget {
  const NumberTranslateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator.get<NumberTranslatorCubit>()),
        BlocProvider(create: (context) => serviceLocator.get<ConfigurationsCubit>())
      ],
      child: const _NumberTranslateApp(),
    );
  }
}

class _NumberTranslateApp extends StatelessWidget {
  const _NumberTranslateApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('es', 'ES'),
        Locale('en', 'US'),
      ],
      path: 'assets/translations',
      startLocale: const Locale('es', 'ES'),
      fallbackLocale: const Locale('en', 'US'),
      useFallbackTranslations: true,
      child: BlocBuilder<ConfigurationsCubit, ConfigurationsState>(
        buildWhen: (previous, current) {
          if (previous is! ConfigurationsInitial || current is! ConfigurationsInitial) return false;
          return previous.isSpanishLanguaje != current.isSpanishLanguaje;
        },
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: (state as ConfigurationsInitial).isSpanishLanguaje? context.supportedLocales.first: context.supportedLocales.last,
            title: 'Material App',
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            darkTheme: ThemeData.dark(),
            themeMode: ThemeMode.dark,
            theme: ThemeData.dark(),
          );
        },
      ),
    );
  }
}