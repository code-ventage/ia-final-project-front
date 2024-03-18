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

  Future<void> logIn() async {
    emit(
      state.copyWith(
        isSigned: await serviceLocator.get<AuthService>().logIn(
              UserEntity(
                username: usernameController.text,
                password: passwordController.text,
              ),
            ),
      ),
    );
  }

  Future<void> signUp() async {
    emit(
      state.copyWith(
        isSigned: await serviceLocator.get<AuthService>().signUp(
              UserEntity(
                username: usernameController.text,
                password: passwordController.text,
              ),
            ),
      ),
    );
  }

  void changePage() {
    emit(state.copyWith(isSignInPage: !(state as AuthInitial).isSignInPage));
  }

  void changePasswordVisibility() {
    emit(state.copyWith(showPassword: !(state as AuthInitial).showPassword));
  }
}