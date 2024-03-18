part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  AuthInitial copyWith({
    bool? isSignInPage,
    bool? showPassword,
    bool? isValidPassword,
  });
}

class AuthInitial extends AuthState {
  final bool isSignInPage;
  final bool showPassword;
  final bool isValidPassword;

  const AuthInitial({
    this.isSignInPage = true,
    this.showPassword = false,
    this.isValidPassword = true,
  });

  @override
  List<Object> get props => [isSignInPage, showPassword, isValidPassword];

  @override
  AuthInitial copyWith({
    bool? isSignInPage,
    bool? showPassword,
    bool? isValidPassword,
  }) {
    return AuthInitial(
      isSignInPage: isSignInPage ?? this.isSignInPage,
      showPassword: showPassword ?? this.showPassword,
      isValidPassword: isValidPassword ?? this.isValidPassword,
    );
  }
}