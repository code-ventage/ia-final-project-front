part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  AuthInitial copyWith({
    bool? isSigned,
    bool? isSignInPage,
    bool? showPassword,
  });
}

class AuthInitial extends AuthState {
  final bool isSigned;
  final bool isSignInPage;
  final bool showPassword;

  const AuthInitial({
    this.isSigned = false,
    this.isSignInPage = true,
    this.showPassword = false,
  });

  @override
  List<Object> get props => [isSigned, isSignInPage, showPassword];

  @override
  AuthInitial copyWith({
    bool? isSigned,
    bool? isSignInPage,
    bool? showPassword,
  }) {
    return AuthInitial(
      isSigned: isSigned ?? this.isSigned,
      isSignInPage: isSignInPage ?? this.isSignInPage,
    );
  }
}