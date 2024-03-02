import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ia_final_project_front/config/service_locator/get_it.dart';

import '../../bloc/translation/number_translator_cubit.dart';
import '../../widgets/custom_text_form_field_widget.dart';

class NumberTranslatorPage extends StatelessWidget {
  const NumberTranslatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<NumberTranslatorCubit, NumberTranslatorState>(
          builder: (context, state) {
            if (state is NumberTranslatorInitial) {
              final cubit = serviceLocator.get<NumberTranslatorCubit>();
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
                          child: Text(
                            'Number to translate',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          width: 200,
                          child: CustomTextFormField(
                            controller: serviceLocator.get<NumberTranslatorCubit>().numberToTranslateController,
                            cubit: cubit,
                            readOnly: false,
                            borderColor: state.validationFailed ? Theme.of(context).colorScheme.error : null,
                            onChanged: (value) async {
                              if (await cubit.validateNumberToTranslate()) {
                                // debugPrint('Valid number to translate!!');
                                cubit.translate(numberToTranslate: serviceLocator.get<NumberTranslatorCubit>().numberToTranslateController.text);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: IconButton.outlined(
                      onPressed: () {},
                      icon: const Icon(
                        size: 32.0,
                        Icons.swap_vert,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Translated number',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          width: 200,
                          child: BlocBuilder<NumberTranslatorCubit, NumberTranslatorState>(
                            builder: (context, state) {
                              if (state is NumberTranslatorInitial) {
                                return CustomTextFormField(
                                  controller: serviceLocator.get<NumberTranslatorCubit>().translatedNumberController..text = state.translation,
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
                  ),
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}