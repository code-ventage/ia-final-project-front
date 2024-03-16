import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(ScoreInitial());
}