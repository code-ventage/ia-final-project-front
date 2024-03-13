import 'package:ia_final_project_front/number_translator/data/models/user_model.dart';

abstract class AuthDatasource {
  Future<bool> signUp(UserModel userModel);

  Future<bool> logIn(UserModel userModel);
}

class AuthDatasourceImpl extends AuthDatasource {
  @override
  Future<bool> logIn(UserModel userModel) async{
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<bool> signUp(UserModel userModel) async{
    // TODO: implement signUp
    throw UnimplementedError();
  }
}