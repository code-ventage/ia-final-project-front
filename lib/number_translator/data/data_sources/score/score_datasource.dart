import 'package:ia_final_project_front/number_translator/data/models/user_score_model.dart';

abstract class ScoreDatasource {
  Future<bool> save(UserScoreModel userModel);

  Future<List<UserScoreModel>> getAll();
}

class ScoreDatasourceImpl extends ScoreDatasource {
  @override
  Future<List<UserScoreModel>> getAll() async{
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<bool> save(UserScoreModel userModel) async{
    // TODO: implement save
    throw UnimplementedError();
  }
}