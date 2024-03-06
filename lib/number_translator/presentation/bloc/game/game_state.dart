part of 'game_cubit.dart';

abstract class GameState extends Equatable {
  const GameState();

  GameInitial copyWith({bool? isFirstTime, bool? isInitializing, int? randomNumberLimit, bool? finished});
}

class GameInitial extends GameState {
  final bool isFirstTime;
  final bool isInitializing;
  final int randomNumberLimit;
  final bool finished;

  const GameInitial({this.isFirstTime = true, this.isInitializing = false, this.randomNumberLimit = 1000, this.finished = false});

  @override
  List<Object> get props => [isFirstTime, isInitializing, randomNumberLimit, finished];

  @override
  GameInitial copyWith({bool? isFirstTime, bool? isInitializing, int? randomNumberLimit, bool? finished}) {
    return GameInitial(
      isFirstTime: isFirstTime ?? this.isFirstTime,
      isInitializing: isInitializing?? this.isInitializing,
      randomNumberLimit: randomNumberLimit?? this.randomNumberLimit,
      finished: finished?? this.finished,
    );
  }
}