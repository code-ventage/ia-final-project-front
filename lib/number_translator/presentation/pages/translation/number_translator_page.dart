import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';

import '../../../../go_router/routes.dart';
import '../../bloc/translation/number_translator_cubit.dart';
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        firstTextFormField(
                            context, height, width * 0.45, cubit, state),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.155),
                          child: IconButton.outlined(
                            onPressed: () {},
                            icon: Icon(
                              size: (height + width) < 300
                                  ? (height + width) * 0.035
                                  : (height + width) * 0.020,
                              Icons.swap_horiz,
                            ),
                          ),
                        ),
                        secondTextFormField(
                            context, height, width * 0.45, cubit),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        firstTextFormField(
                            context, height, width, cubit, state),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: IconButton.outlined(
                            onPressed: () {},
                            icon: Icon(
                              size: (height + width) * 0.035,
                              Icons.swap_vert,
                            ),
                          ),
                        ),
                        secondTextFormField(context, height, width, cubit)
                      ],
                    );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Padding firstTextFormField(BuildContext context, double height, double width,
      NumberTranslatorCubit cubit, NumberTranslatorInitial state) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
            child: TextButton(
              onPressed: (){},
              child: Text(
                tr('number_to_translate_label'),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.25,
            width: width * 0.85,
            child: CustomTextFormField(
              controller: serviceLocator
                  .get<NumberTranslatorCubit>()
                  .numberToTranslateController,
              cubit: cubit,
              readOnly: false,
              borderColor: state.validationFailed
                  ? Theme.of(context).colorScheme.error
                  : null,
              onChanged: (value) async {
                if (await cubit.validateNumberToTranslate()) {
                  cubit.translate(
                      numberToTranslate: serviceLocator
                          .get<NumberTranslatorCubit>()
                          .numberToTranslateController
                          .text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Padding secondTextFormField(BuildContext context, double height, double width,
      NumberTranslatorCubit cubit) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
            child: TextButton(
              onPressed: (){},
              child: Text(
                tr('translated_number_label'),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.25,
            width: width * 0.85,
            child: BlocBuilder<NumberTranslatorCubit, NumberTranslatorState>(
              builder: (context, state) {
                if (state is NumberTranslatorInitial) {
                  return CustomTextFormField(
                    borderColor: state.validationFailed
                        ? Theme.of(context).colorScheme.error
                        : null,
                    controller: serviceLocator
                        .get<NumberTranslatorCubit>()
                        .translatedNumberController
                      ..text = state.translation,
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