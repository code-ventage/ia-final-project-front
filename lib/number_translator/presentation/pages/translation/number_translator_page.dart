import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';

import '../../../../go_router/routes.dart';
import '../../bloc/translation/number_translator_cubit.dart';
import '../../widgets/custom_icon_selection_button.dart';
import '../../widgets/custom_text_form_field_widget.dart';

class NumberTranslatorPage extends StatelessWidget {
  const NumberTranslatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(tr('number_translator_page_title'), style: const TextStyle(fontSize: 20)),
        ),
        toolbarHeight: height * 0.1,
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.configurations.name);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<NumberTranslatorCubit, NumberTranslatorState>(
          builder: (context, state) {
            if (state is NumberTranslatorInitial) {
              final cubit = serviceLocator.get<NumberTranslatorCubit>();
              return MediaQuery.of(context).size.width > 600
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        firstTextFormField(context, height, width * 0.45, cubit, state, () => cubit.changeTranslationType()),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.216),
                          child: IconButton.outlined(
                            onPressed: () => context.read<NumberTranslatorCubit>().changeTranslationType(),
                            icon: Icon(
                              size: (height + width) * 0.015,
                              Icons.swap_horiz,
                            ),
                          ),
                        ),
                        secondTextFormField(context, height, width * 0.45, cubit, state, () {
                          return cubit.changeTranslationType();
                        }),
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
        crossAxisAlignment: width>300? CrossAxisAlignment.start: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: CustomIconSelectionButton(
                  isSelected: state.isLetterTranslation,
                  onSelected: state.isLetterTranslation ? onPressed : null,
                  icon: Icons.numbers,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: CustomIconSelectionButton(
                  isSelected: !state.isLetterTranslation,
                  onSelected: !state.isLetterTranslation ? onPressed : null,
                  icon: Icons.translate,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.25,
            width: width * 0.85,
            child: CustomTextFormField(
              controller: cubit.numberToTranslateController,
              cubit: cubit,
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
        crossAxisAlignment: width>300? CrossAxisAlignment.start: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: CustomIconSelectionButton(
                  isSelected: state.isLetterTranslation,
                  onSelected: state.isLetterTranslation ? onPressed : null,
                  icon: Icons.translate,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: CustomIconSelectionButton(
                  isSelected: !state.isLetterTranslation,
                  onSelected: !state.isLetterTranslation ? onPressed : null,
                  icon: Icons.numbers,
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
                    cubit: cubit,
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
