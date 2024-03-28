import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/config/service_locator/service_locator.dart';
import 'package:ia_final_project_front/go_router/routes.dart';
import 'package:ia_final_project_front/number_translator/presentation/bloc/auth/auth_cubit.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is! AuthInitial) {
                  return const CircularProgressIndicator();
                }

                final cubit = serviceLocator.get<AuthCubit>();

                return Column(
                  children: [
                    const Gap(20),
                    const Icon(
                      Icons.account_box_rounded,
                      size: 180,
                      color: Colors.lightBlueAccent,
                    ),
                    Text(
                      state.isSignInPage ? tr('login') : tr('create_account'),
                      style: TextStyle(
                        fontSize: textTheme.headlineMedium?.fontSize,
                      ),
                    ),
                    const Gap(15),
                    CustomTextFormField(
                      textEditingController: cubit.usernameController,
                      label: tr('username'),
                      error: state.isValidPassword,
                      onChanged: cubit.validateTextFormFields,
                      autofocus: true,
                    ),
                    const Gap(15),
                    RawKeyboardListener(
                      focusNode: FocusNode(),
                      key: const ValueKey('enter'),
                      onKey: (value) {
                        if (value.logicalKey == LogicalKeyboardKey.enter) {
                          if (state.isSignInPage) {
                            cubit.logIn(() => context
                                .replaceNamed(Routes.numberTranslator.name));
                          }
                        }
                      },
                      child: CustomPasswordTextFormField(
                        passwordController: cubit.passwordController,
                        label: tr('password'),
                        isShowPassword: state.showPassword,
                        error:
                            state.isSignInPage ? state.isValidPassword : null,
                        onShowPasswordPressed: cubit.changePasswordVisibility,
                        onChanged: cubit.validateTextFormFields,
                      ),
                    ),
                    const Gap(15),
                    if (!state.isSignInPage)
                      ...buildRepeatPasswordTextFormField(
                        passwordController: cubit.repeatPasswordController,
                        showPassword: state.showPassword,
                        context: context,
                        error:
                            state.isSignInPage ? state.isValidPassword : null,
                        onShowPasswordPressed: cubit.changePasswordVisibility,
                      ),
                    if (!state.isValidPassword)
                      FadeInLeft(
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          width: double.infinity,
                          height: 30,
                          alignment: Alignment.topLeft,
                          child: Text(
                            state.isSignInPage
                                ? tr('invalid_password')
                                : tr('invalid_username'),
                            style: TextStyle(color: Colors.red.shade300),
                          ),
                        ),
                      ),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: cubit.usernameController.text.isEmpty ||
                                cubit.passwordController.text.isEmpty
                            ? null
                            : (!state.isSignInPage &&
                                    cubit.repeatPasswordController.text.isEmpty)
                                ? null
                                : () {
                                    if (!state.isSignInPage) {
                                      cubit.validatePassword(() =>
                                          context.replaceNamed(
                                              Routes.numberTranslator.name));
                                    } else {
                                      cubit.logIn(() => context.replaceNamed(
                                          Routes.numberTranslator.name));
                                    }
                                  },
                        label: Text(
                            state.isSignInPage ? tr('sign_in') : tr('sign_up')),
                        icon: const Icon(Icons.login),
                      ),
                    ),
                    const Gap(15),
                    TextButton(
                      onPressed: () => cubit.changePage(),
                      child: Text(state.isSignInPage
                          ? tr('dont_have_account')
                          : tr('already_have_account')),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  buildRepeatPasswordTextFormField(
      {required TextEditingController passwordController,
      required bool showPassword,
      required void Function() onShowPasswordPressed,
      bool? error,
      required BuildContext context}) {
    var cubit = serviceLocator.get<AuthCubit>();
    return [
      RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (value) {
          if (value.logicalKey == LogicalKeyboardKey.enter) {
            cubit.validatePassword(
                () => context.replaceNamed(Routes.numberTranslator.name));
          }
        },
        child: CustomPasswordTextFormField(
          passwordController: passwordController,
          label: tr('repeat_your_password'),
          isShowPassword: showPassword,
          error: error,
          onShowPasswordPressed: onShowPasswordPressed,
          onChanged: cubit.validateTextFormFields,
        ),
      ),
      const Gap(15),
    ];
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.label,
    this.error,
    this.onChanged,
    this.autofocus = false,
  });

  final TextEditingController textEditingController;
  final String label;
  final bool? error;
  final void Function(String value)? onChanged;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.bottom,
      cursorHeight: 22,
      onChanged: onChanged,
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(label),
        focusedBorder: !(error ?? true)
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Colors.red.shade300,
                  width: 4,
                ),
              )
            : null,
        enabledBorder: !(error ?? true)
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Colors.red.shade300,
                  width: 4,
                ),
              )
            : null,
      ),
    );
  }
}

class CustomPasswordTextFormField extends StatelessWidget {
  const CustomPasswordTextFormField(
      {super.key,
      required this.passwordController,
      required this.label,
      this.onShowPasswordPressed,
      required this.isShowPassword,
      this.error,
      this.onChanged});

  final String label;
  final bool? error;
  final bool isShowPassword;
  final TextEditingController passwordController;
  final void Function()? onShowPasswordPressed;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !isShowPassword,
      controller: passwordController,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onShowPasswordPressed,
          icon: const Icon(Icons.remove_red_eye_rounded),
        ),
        label: Text(label),
        focusedBorder: !(error ?? true)
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Colors.red.shade300,
                  width: 4,
                ),
              )
            : null,
        enabledBorder: !(error ?? true)
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: Colors.red.shade300,
                  width: 4,
                ),
              )
            : null,
      ),
    );
  }
}
