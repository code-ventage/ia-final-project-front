part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  AuthInitial copyWith({
    bool? isSignInPage,
    bool? showPassword,
    bool? isValidPassword,
    bool? enableSubmitButton
  });
}

class AuthInitial extends AuthState {
  final bool isSignInPage;
  final bool showPassword;
  final bool isValidPassword;
  final bool enableSubmitButton;

  const AuthInitial({
    this.isSignInPage = true,
    this.showPassword = false,
    this.isValidPassword = true,
    this.enableSubmitButton = false
  });

  @override
  List<Object> get props => [isSignInPage, showPassword, isValidPassword, enableSubmitButton];

  @override
  AuthInitial copyWith({
    bool? isSignInPage,
    bool? showPassword,
    bool? isValidPassword,
    bool? enableSubmitButton
  }) {
    return AuthInitial(
      isSignInPage: isSignInPage ?? this.isSignInPage,
      showPassword: showPassword ?? this.showPassword,
      isValidPassword: isValidPassword ?? this.isValidPassword,
      enableSubmitButton: enableSubmitButton ?? this.enableSubmitButton
    );
  }
}