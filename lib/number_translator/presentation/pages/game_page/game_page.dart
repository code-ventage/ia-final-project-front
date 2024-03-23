import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';
import 'package:ia_final_project_front/number_translator/domain/entities/user_score_entity.dart';
import 'package:ia_final_project_front/number_translator/domain/use_cases/auth/auth_service.dart';
import 'package:ia_final_project_front/number_translator/domain/use_cases/score/score_service.dart';
import 'package:ia_final_project_front/number_translator/presentation/widgets/custom_animated_timer.dart';
import 'package:ia_final_project_front/number_translator/presentation/widgets/custom_text_form_field_widget.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../bloc/game/game_cubit.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = serviceLocator.get<GameCubit>();
    return BlocConsumer<GameCubit, GameState>(
      listener: (context, state) {
        if (state is! GameInitial || state.isFirstTime || state.finished) return;
        cubit.responseTextController.text = '';
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              title: Text(
                tr('game_page_title'),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  cubit.resetState();
                  context.pop();
                },
              )),
          body: (state as GameInitial).isFirstTime
              ? const _GameIntroduction()
              : state.isInitializing
                  ? Center(
                      child: CustomAnimatedTimer(
                        duration: const Duration(seconds: 3),
                        size: const Size(150, 150),
                        onFinished: () {
                          cubit.startGame();
                        },
                      ),
                    )
                  : state.finished
                      ? const _GameFinished()
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
    var cubit = serviceLocator.get<GameCubit>();
    var textTheme = Theme.of(context).textTheme;
    return BlocBuilder<GameCubit, GameState>(
      buildWhen: (previous, current) => !(current as GameInitial).finished,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Animate(
              effects: const [ScaleEffect(duration: Duration(milliseconds: 50))],
              child: const Icon(Icons.directions_run, size: 86, color: Colors.lightBlueAccent),
            ),
            Text(
              cubit.currentNumber.toString(),
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 32),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: CustomTextFormField(
                  controller: cubit.responseTextController,
                  readOnly: false,
                ),
              ),
            ),
            const Gap(20),
            CustomAnimatedTimer(
              duration: const Duration(seconds: 60),
              size: const Size(50, 50),
              onFinished: () => cubit.finishState(() {}),
              fontSize: 26,
              strokeWeight: 4.0,
            ),
            const Gap(20),
            ElevatedButton(
              onPressed: () {
                cubit.finishState(() {});
              },
              child: Text(tr('game_finish')), // todo change the text to tr
            ),
          ],
        );
      },
    );
  }
}

class _GameFinished extends StatelessWidget {
  const _GameFinished({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var authService = serviceLocator.get<AuthService>();
    authService.get() != null
        ? serviceLocator.get<ScoreService>().save(
              UserScoreEntity(
                username: authService.get()!.username,
                score: '${serviceLocator.get<GameCubit>().currentPoints}',
              ),
            )
        : null;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Gap(45),
          const Icon(
            Icons.stars_outlined,
            size: 128,
            color: Colors.lightBlueAccent,
          ),
          const Gap(20),
          Text(
            tr('game_your_score'),
            style: textTheme.titleLarge?.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Gap(20),
          Text(
            '${serviceLocator.get<GameCubit>().currentPoints}',
            style: textTheme.titleLarge?.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _GameIntroduction extends StatelessWidget {
  const _GameIntroduction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = serviceLocator.get<GameCubit>();
    var colorScheme = Theme.of(context).colorScheme;
    return IntroductionScreen(
      globalBackgroundColor: colorScheme.background,
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
        return cubit.saveFirstTime();
      },
      done: Text(tr('game_done_button')),
      next: Text(tr('game_next_button')),
      back: Text(tr('game_back_button')),
      showDoneButton: true,
      showBackButton: true,
      dotsDecorator: DotsDecorator(
        color: colorScheme.primary,
        activeColor: colorScheme.onInverseSurface,
        size: const Size(8, 8),
        activeSize: const Size(14, 14),
      ),
    );
  }
}