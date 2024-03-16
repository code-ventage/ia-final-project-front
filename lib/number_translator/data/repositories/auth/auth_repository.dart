import 'package:ia_final_project_front/number_translator/data/data_sources/auth/auth_datasource.dart';

import '../../models/user_model.dart';

abstract class AuthRepository {
  Future<bool> signUp(UserModel userModel);

  Future<bool> logIn(UserModel userModel);
}

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepositoryImpl({
    required this.authDatasource,
  });

  @override
  Future<bool> logIn(UserModel userModel) async {
    return await authDatasource.logIn(userModel);
  }

  @override
  Future<bool> signUp(UserModel userModel) async {
    return await authDatasource.signUp(userModel);
  }
}