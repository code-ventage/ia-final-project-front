import '../../entities/user_entity.dart';
import '../../repositories/auth/auth_domain_repository.dart';

abstract class AuthService {
  Future<bool> signUp(UserEntity userEntity);

  Future<bool> logIn(UserEntity userEntity);
}

class AuthServiceImpl extends AuthService {
  final AuthDomainRepository repository;
  bool isSigned = false;

  AuthServiceImpl({required this.repository});

  @override
  Future<bool> logIn(UserEntity userEntity) async {
    isSigned = await repository.logIn(userEntity);
    return isSigned;
  }

  @override
  Future<bool> signUp(UserEntity userEntity) async {
    isSigned = await repository.signUp(userEntity);
    return isSigned;
  }
}