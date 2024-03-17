import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/go_router/routes.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final textTheme = Theme.of(context).textTheme;
    final isSignInPage = true; // todo: en un futuro se debe coger del estado

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const Gap(20),
                const Icon(
                  Icons.account_box_rounded,
                  size: 180,
                  color: Colors.lightBlueAccent,
                ),
                Text(
                  isSignInPage ? 'Login' : 'Create an account',
                  style: TextStyle(
                    fontSize: textTheme.headlineMedium?.fontSize,
                    // letterSpacing: 5,
                  ),
                ),
                const Gap(15),
                CustomTextFormField(
                  textEditingController: usernameController,
                  label: 'Username',
                ),
                const Gap(15),
                CustomPasswordTextFormField(
                  passwordController: passwordController,
                  label: 'Password',
                  isShowPassword: false,
                  onShowPasswordPressed: () {},
                ),
                const Gap(15),
                if(!isSignInPage)
                ...buildRepeatPasswordTextFormField(passwordController: passwordController),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      // todo: iniciar sesion
                    },
                    label: Text(isSignInPage ? 'Sign in' : 'Sign up'),
                    icon: const Icon(Icons.login),
                  ),
                ),
                const Gap(15),
                TextButton(
                  onPressed: () {
                    // todo: navegar a la pagina de crear cuenta
                    context.pushNamed(Routes.authPage.name);
                  },
                  child: Text(isSignInPage ? 'Don\'t have an account? Create one' : 'Already have an account? Sign in'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildRepeatPasswordTextFormField({required TextEditingController passwordController}) {
    return [
      CustomPasswordTextFormField(
        passwordController: passwordController,
        label: 'Repeat your password',
        isShowPassword: false,
        onShowPasswordPressed: () {},
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
  });

  final TextEditingController textEditingController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.left,
      textAlignVertical: TextAlignVertical.bottom,
      cursorHeight: 22,
      controller: textEditingController,
      decoration: InputDecoration(
        label: Text(label),
      ),
    );
  }
}

class CustomPasswordTextFormField extends StatelessWidget {
  const CustomPasswordTextFormField(
      {super.key, required this.passwordController, required this.label, this.onShowPasswordPressed, required this.isShowPassword});

  final String label;
  final bool isShowPassword;
  final TextEditingController passwordController;
  final void Function()? onShowPasswordPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !isShowPassword,
      controller: passwordController,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onShowPasswordPressed,
          icon: const Icon(Icons.remove_red_eye_rounded),
        ),
        label: Text(label),
      ),
    );
  }
}