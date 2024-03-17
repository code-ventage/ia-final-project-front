import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ia_final_project_front/go_router/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final size = Theme.of(context).textTheme;
    final isSignInPage = true; // todo: en un futuro se debe coger del estado

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const Gap(10),
                const Icon(
                  Icons.account_box_rounded,
                  size: 180,
                  color: Colors.lightBlueAccent,
                ),
                Text(
                  isSignInPage ? 'Login' : 'Create an account',
                  style: TextStyle(
                    fontSize: size.headlineMedium?.fontSize,
                    // letterSpacing: 5,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  textAlign: TextAlign.left,
                  textAlignVertical: TextAlignVertical.bottom,
                  cursorHeight: 22,
                  controller: usernameController,
                  decoration: const InputDecoration(
                    label: Text('Username'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  obscureText: true, //todo: cambiar dependiendo de si esta en mostrar
                  controller: passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye_rounded),
                    ),
                    label: const Text('Password'),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
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
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    // todo: navegar a la pagina de crear cuenta
                    context.pushNamed(Routes.signupPage.name);
                  },
                  child: Text(isSignInPage ? "Don't have an account? Create one" : "Already have an account? Sign in"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}