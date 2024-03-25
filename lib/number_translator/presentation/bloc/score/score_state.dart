part of 'score_cubit.dart';

abstract class ScoreState extends Equatable {
  const ScoreState();

  ScoreState copyWith({
    int? userScoreVersions,
    bool? initialized,
  });
}

class ScoreInitial extends ScoreState {
  const ScoreInitial({
    required this.userScoreVersions,
    this.initialized = false,
  });

  final bool initialized;
  final int userScoreVersions;

  @override
  List<Object> get props => [userScoreVersions, initialized];

  @override
  ScoreInitial copyWith({
    int? userScoreVersions,
    bool? initialized,
  }) {
    return ScoreInitial(
      userScoreVersions: userScoreVersions ?? this.userScoreVersions,
      initialized: initialized ?? this.initialized,
    );
  }
}