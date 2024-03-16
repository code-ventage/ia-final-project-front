import '../../entities/user_score_entity.dart';
import '../../repositories/score/score_domain_repository.dart';

abstract class ScoreService {
  Future<bool> save(UserScoreEntity userScoreEntity);

  Future<List<UserScoreEntity>> getAll();
}

class ScoreServiceImpl extends ScoreService {
  final ScoreDomainRepository repository;

  ScoreServiceImpl({required this.repository});

  @override
  Future<List<UserScoreEntity>> getAll() async {
    return await repository.getAll();
  }

  @override
  Future<bool> save(UserScoreEntity userScoreEntity) async {
    return await repository.save(userScoreEntity);
  }
}