import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/service_locator/get_it.dart';
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
    return MaterialApp.router(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
    );
  }
}