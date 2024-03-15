import 'package:flutter/material.dart';
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
    final isSignInPage = false; // todo: en un futuro se debe coger del estado

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const Icon(
                Icons.account_box_rounded,
                size: 180,
                color: Colors.lightBlueAccent,
              ),
              Text(
                isSignInPage ? 'Login' : 'Sign up',
                style: TextStyle(
                  fontSize: size.headlineMedium?.fontSize,
                  // letterSpacing: 5,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  label: Text('Username'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  label: Text('Password'),
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
                  label: Text(isSignInPage ? 'Sign in' : 'Create account'),
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
                child: Text(isSignInPage
                    ? "Don't have an account? Create one"
                    : "Already have an account? Sign in"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
