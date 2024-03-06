import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';
import 'package:ia_final_project_front/number_translator/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../go_router/routes.dart';
import '../../bloc/game/game_cubit.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              tr('game_page_title'),
            ),
          ),
          body: (state as GameInitial).isFirstTime
              ? const _GameIntroduction()
              : const _Game(),
        );
      },
    );
  }
}

class _Game extends StatelessWidget {
  const _Game({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hola!!',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 32),
          ),
          const Gap(10),
          Text(
            'Asi que quieres jugar!!',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: CustomTextFormField(
                controller: TextEditingController(
                    text:
                        'Este juego es simple, te lo explico por pasos:\n1 - Se te mostrara un numero en pantalla, y debes escribir su nombre en el menor '
                        'tiempo posible.\n 2 - Asegurate de escribir el nombre antes de terminar el tiempo.'),
                readOnly: true,
              ),
            ),
          ),
        ],
      );
  }
}

class _GameIntroduction extends StatelessWidget {
  const _GameIntroduction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
        globalBackgroundColor: Theme.of(context).colorScheme.background,
        scrollPhysics: const BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            image: const Icon(
              Icons.question_answer_outlined,
              size: 128,
              color: Colors.lightBlueAccent,
            ),
            title: tr('game_first_introduction'),
            body: tr('game_first_description'),
          ),
          PageViewModel(
            image: const Icon(
              Icons.timelapse_rounded,
              size: 128,
              color: Colors.lightBlueAccent,
            ),
            title: tr('game_second_introduction'),
            body: tr('game_second_description'),
          ),
          PageViewModel(
            image: const Icon(
              Icons.golf_course_sharp,
              color: Colors.lightBlueAccent,
              size: 128,
            ),
            title: tr('game_third_introduction'),
            body: tr('game_third_description'),
          ),
        ],
        onDone: () {
          serviceLocator.get<GameCubit>().saveFirstTime();
          context.pushReplacementNamed(Routes.numberTranslator.name);
        },
        done: const Text('done'),
        next: const Text('next'),
        back: const Text('back'),
        showDoneButton: true,
        showBackButton: true,
        dotsDecorator: DotsDecorator(
          color: Theme.of(context).colorScheme.primary,
          activeColor: Theme.of(context).colorScheme.onInverseSurface,
          size: const Size(8, 8),
          activeSize: const Size(12, 12),
        ),
      );
  }
}