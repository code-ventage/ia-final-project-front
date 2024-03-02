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
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150,
                      width: 200,
                      child: CustomTextFormField(
                        controller: serviceLocator.get<NumberTranslatorCubit>().numberToTranslateController,
                        cubit: cubit,
                        readOnly: false,
                        borderColor: state.validationFailed ? Theme.of(context).colorScheme.error : null,
                        onChanged: (value) async {
                          if (await cubit.validateNumberToTranslate()) {
                            debugPrint('Valid number to translate!!');
                            cubit.translate(numberToTranslate: serviceLocator.get<NumberTranslatorCubit>().numberToTranslateController.text);
                          }else {

                          }
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 150,
                      width: 200,
                      child: BlocBuilder<NumberTranslatorCubit, NumberTranslatorState>(
                        builder: (context, state) {
                          if(state is NumberTranslatorInitial) {
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