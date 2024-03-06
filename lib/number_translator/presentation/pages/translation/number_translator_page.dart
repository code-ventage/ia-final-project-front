import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';

import '../../../../go_router/routes.dart';
import '../../bloc/configurations/configurations_cubit.dart';
import '../../bloc/translation/number_translator_cubit.dart';
import '../../widgets/custom_icon_selection_button.dart';
import '../../widgets/custom_text_form_field_widget.dart';
import '../../widgets/custom_tooltip.dart';

class NumberTranslatorPage extends StatelessWidget {
  const NumberTranslatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final cubit = serviceLocator.get<NumberTranslatorCubit>();
    return BlocConsumer<ConfigurationsCubit, ConfigurationsState>(
      buildWhen: (previous, current) {
        if (previous is! ConfigurationsInitial || current is! ConfigurationsInitial) return false;
        return previous.isSpanishLanguage != current.isSpanishLanguage;
      },
      listener: (context, state) {
        context.setLocale((state as ConfigurationsInitial).isSpanishLanguage ? context.supportedLocales.first : context.supportedLocales.last);
        serviceLocator.get<ConfigurationsCubit>().currentLanguage =
            context.locale == context.supportedLocales.first ? tr('spanish_language') : tr('english_language');
        cubit.validateNumberToTranslate().then(
              (value) => {
                cubit.translate(
                  numberToTranslate: cubit.numberToTranslateController.text,
                )
              },
            );
      },
      builder: (context, state) {
        cubit.validateNumberToTranslate();
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(tr('number_translator_page_title'), style: const TextStyle(fontSize: 20)),
            ),
            toolbarHeight: height * 0.1,
            actions: [
              CustomTooltip(
                message: tr('settings'),
                child: IconButton(
                  onPressed: () {
                    context.pushNamed(Routes.configurations.name);
                  },
                  icon: const Icon(Icons.settings),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: BlocBuilder<NumberTranslatorCubit, NumberTranslatorState>(
                builder: (context, state) {
                  if (state is NumberTranslatorInitial) {
                    return MediaQuery.of(context).size.width > 600
                        ? Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  firstTextFormField(context, height, width * 0.45, cubit, state, () => cubit.changeTranslationType()),
                                  CustomTooltip(
                                    message: tr('swap'),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: height * 0.216),
                                      child: IconButton.outlined(
                                        onPressed: () => context.read<NumberTranslatorCubit>().changeTranslationType(),
                                        icon: Icon(
                                          size: (height + width) * 0.015,
                                          Icons.swap_horiz,
                                        ),
                                      ),
                                    ),
                                  ),
                                  secondTextFormField(context, height, width * 0.45, cubit, state, () {
                                    return cubit.changeTranslationType();
                                  }),
                                ],
                              ),
                              const Gap(125),
                              SizedBox(
                                width: 160,
                                height: 50,
                                child: FloatingActionButton(
                                  isExtended: true,
                                  child: Text(tr('play_a_game'), style: Theme.of(context).textTheme.titleMedium),
                                  onPressed: () => context.pushNamed(Routes.gamePage.name),
                                ),
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              firstTextFormField(context, height, width, cubit, state, () => cubit.changeTranslationType()),
                              secondTextFormField(context, height, width, cubit, state, () => cubit.changeTranslationType()),
                            ],
                          );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
          floatingActionButton: width < 600
              ? CustomTooltip(
                  message: tr('play_a_game'),
                  child: FloatingActionButton.small(
                    onPressed: () => context.pushNamed(Routes.gamePage.name),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    child: const Icon(Icons.gamepad_outlined),
                  ),
                )
              : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }

  Padding firstTextFormField(
    BuildContext context,
    double height,
    double width,
    NumberTranslatorCubit cubit,
    NumberTranslatorInitial state,
    void Function() onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: width > 600 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: CustomTooltip(
                  message: tr('translate_numbers'),
                  child: CustomIconSelectionButton(
                    isSelected: state.isLetterTranslation,
                    onSelected: state.isLetterTranslation ? onPressed : null,
                    icon: Icons.numbers,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: CustomTooltip(
                  message: tr('translate_letters'),
                  child: CustomIconSelectionButton(
                    isSelected: !state.isLetterTranslation,
                    onSelected: !state.isLetterTranslation ? onPressed : null,
                    icon: Icons.translate,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.25,
            width: width * 0.85,
            child: CustomTextFormField(
              controller: cubit.numberToTranslateController,
              readOnly: false,
              borderColor: state.validationFailed ? Theme.of(context).colorScheme.error : null,
              onChanged: (value) async {
                if (await cubit.validateNumberToTranslate()) {
                  cubit.translate(
                    numberToTranslate: cubit.numberToTranslateController.text,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding secondTextFormField(
    BuildContext context,
    double height,
    double width,
    NumberTranslatorCubit cubit,
    NumberTranslatorInitial state,
    void Function() onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: width > 600 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: CustomTooltip(
                  message: tr('translate_letters'),
                  child: CustomIconSelectionButton(
                    isSelected: state.isLetterTranslation,
                    onSelected: state.isLetterTranslation ? onPressed : null,
                    icon: Icons.translate,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: CustomTooltip(
                  message: tr('translate_numbers'),
                  child: CustomIconSelectionButton(
                    isSelected: !state.isLetterTranslation,
                    onSelected: !state.isLetterTranslation ? onPressed : null,
                    icon: Icons.numbers,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.25,
            width: width * 0.85,
            child: BlocBuilder<NumberTranslatorCubit, NumberTranslatorState>(
              builder: (context, state) {
                if (state is NumberTranslatorInitial) {
                  return CustomTextFormField(
                    borderColor: state.validationFailed ? Theme.of(context).colorScheme.error : null,
                    controller: cubit.translatedNumberController,
                    readOnly: true,
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}