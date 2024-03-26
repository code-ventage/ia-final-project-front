import '../../entities/user_entity.dart';
import '../../repositories/auth/auth_domain_repository.dart';

abstract class AuthService {
  UserEntity? get();

  void set(UserEntity userEntity);

  Future<bool> signUp(UserEntity userEntity);

  Future<bool> logIn(UserEntity userEntity);

  void logOut();
}

class AuthServiceImpl extends AuthService {
  final AuthDomainRepository repository;
  bool isSigned = false;
  UserEntity? _userEntity;

  @override
  UserEntity? get() => _userEntity;

  @override
  void set(UserEntity userEntity) => _userEntity = userEntity;

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

  @override
  void logOut() {
    isSigned = false;
    _userEntity = null;
  }
}