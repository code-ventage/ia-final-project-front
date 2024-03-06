import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(const GameInitial());

  void saveFirstTime(){
    emit(state.copyWith(isFirstTime: false));
  }
}