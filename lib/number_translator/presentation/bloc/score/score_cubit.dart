import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';
import 'package:ia_final_project_front/number_translator/domain/use_cases/score/score_service.dart';

import '../../../domain/entities/user_score_entity.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(const ScoreInitial(userScoreVersions: 0));
  List<UserScoreEntity>? userScores;
  final TextEditingController filterEditingController = TextEditingController();

  Future<void> initialize() async {
    userScores = await serviceLocator.get<ScoreService>().getAll();
    emit(state.copyWith(initialized: true));
  }

  void filter(String filter) async {
    if (filter.isEmpty) {
      await initialize();
      emit(state.copyWith(userScoreVersions: (state as ScoreInitial).userScoreVersions + 1));
    } else {
      await initialize();
      final filtered = userScores!.where((element) => element.username.contains(filter.toLowerCase())).toList();
      userScores = filtered;
      emit(state.copyWith(userScoreVersions: (state as ScoreInitial).userScoreVersions + 1));
    }
  }
}