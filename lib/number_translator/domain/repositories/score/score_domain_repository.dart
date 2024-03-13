import 'package:ia_final_project_front/number_translator/data/models/user_score_model.dart';
import 'package:ia_final_project_front/number_translator/domain/entities/user_score_entity.dart';

import '../../../data/repositories/score/score_repository.dart';

abstract class ScoreDomainRepository {
  Future<bool> save(UserScoreEntity userScoreEntity);

  Future<List<UserScoreEntity>> getAll();
}

class ScoreDomainRepositoryImpl extends ScoreDomainRepository {
  final ScoreRepository scoreRepository;

  ScoreDomainRepositoryImpl({
    required this.scoreRepository,
  });

  @override
  Future<List<UserScoreEntity>> getAll() async {
    return (await scoreRepository.getAll())
        .map((userScoreModel) => UserScoreEntity(username: userScoreModel.username, score: userScoreModel.score))
        .toList();
  }

  @override
  Future<bool> save(UserScoreEntity userScoreEntity) async {
    return await scoreRepository.save(UserScoreModel(
      username: userScoreEntity.username,
      score: userScoreEntity.score,
    ));
  }
}