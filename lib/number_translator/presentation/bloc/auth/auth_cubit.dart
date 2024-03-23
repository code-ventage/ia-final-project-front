import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';
import 'package:ia_final_project_front/number_translator/domain/entities/user_entity.dart';
import 'package:ia_final_project_front/number_translator/domain/use_cases/auth/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController = TextEditingController();

  Future<void> logIn(void Function() callback) async {
    var userEntity = UserEntity(
      username: usernameController.text,
      password: passwordController.text,
    );
    var authService = serviceLocator.get<AuthService>();
    if (await authService.logIn(
      userEntity,
    )) {
      authService.set(userEntity);
      callback.call();
      return;
    }
    emit(state.copyWith()); //todo: show auth error
  }

  void validatePassword(void Function() callback) {
    passwordController.text != repeatPasswordController.text ? emit(state.copyWith(isValidPassword: false)) : signUp(callback);
  }

  Future<void> signUp(void Function() callback) async {
    var authService = serviceLocator.get<AuthService>();
    var userEntity = UserEntity(
      username: usernameController.text,
      password: passwordController.text,
    );
    if (await authService.signUp(
      userEntity,
    )) {
      authService.set(userEntity);
      callback.call();
      return;
    }
    emit(state.copyWith()); //todo: show auth error
  }

  void changePage() {
    emit(state.copyWith(isSignInPage: !(state as AuthInitial).isSignInPage));
  }

  void changePasswordVisibility() {
    debugPrint('${!(state as AuthInitial).showPassword}');
    emit(state.copyWith(showPassword: !(state as AuthInitial).showPassword));
  }
}