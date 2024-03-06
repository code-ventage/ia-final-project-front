part of 'game_cubit.dart';

abstract class GameState extends Equatable {
  const GameState();

  GameState copyWith({bool? isFirstTime});
}

class GameInitial extends GameState {
  final bool isFirstTime;

  const GameInitial({this.isFirstTime = true});

  @override
  List<Object> get props => [isFirstTime];

  @override
  GameInitial copyWith({bool? isFirstTime}) {
    return GameInitial(isFirstTime: isFirstTime ?? this.isFirstTime);
  }
}