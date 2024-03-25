import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/auth/auth_cubit.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/configurations/configurations_cubit.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/game/game_cubit.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/score/score_cubit.dart';
import 'package:ia_final_project_front/theme/presentation/bloc/theme_selector_cubit.dart';
import 'package:ia_final_project_front/theme/theme.dart';

import 'config/service_locator/service_locator.dart';
import 'go_router/go_router.dart';
import 'number_translator/presentation/bloc/translation/number_translator_cubit.dart';

void main() async {
  initServices();

  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('es', 'ES'),
        Locale('en', 'US'),
      ],
      saveLocale: true,
      path: 'assets/translations',
      startLocale: const Locale('es', 'ES'),
      fallbackLocale: const Locale('en', 'US'),
      useFallbackTranslations: true,
      child: const NumberTranslateApp()));
}

void initServices() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
}

class NumberTranslateApp extends StatelessWidget {
  const NumberTranslateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator.get<NumberTranslatorCubit>()),
        BlocProvider(create: (context) => serviceLocator.get<ConfigurationsCubit>()),
        BlocProvider(create: (context) => serviceLocator.get<GameCubit>()),
        BlocProvider(create: (context) => serviceLocator.get<ThemeSelectorCubit>()),
        BlocProvider(create: (context)=> serviceLocator.get<AuthCubit>()),
        BlocProvider(create: (context)=> serviceLocator.get<ScoreCubit>()),
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
    return BlocBuilder<ThemeSelectorCubit, ThemeSelectorState>(
      builder: (context, state) {
        if (state is! ThemeSelectorInitial) {
          return const SizedBox();
        }
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Number Translator Apk',
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          darkTheme: CustomTheme(
            brightness: Brightness.dark,
            colorSeed: state.colorSeed,
          ).theme,
          themeMode: state.themeMode,
          theme: CustomTheme(
            brightness: Brightness.light,
            colorSeed: state.colorSeed,
          ).theme,
        );
      },
    );
  }
}