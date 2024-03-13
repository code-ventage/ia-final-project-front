import '../../entities/user_entity.dart';
import '../../repositories/auth/auth_domain_repository.dart';

abstract class AuthService {
  Future<bool> signUp(UserEntity userEntity);

  Future<bool> logIn(UserEntity userEntity);
}

class AuthServiceImpl extends AuthService {
  final AuthDomainRepository repository;

  AuthServiceImpl({required this.repository});

  @override
  Future<bool> logIn(UserEntity userEntity) async {
    return await repository.logIn(userEntity);
  }

  @override
  Future<bool> signUp(UserEntity userEntity) async {
    return await repository.signUp(userEntity);
  }
}