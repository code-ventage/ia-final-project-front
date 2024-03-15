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
                'Login',
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
                height: 30,
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
                  label: const Text('Sign in'),
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
                child: const Text("Don't have an account? Create one"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
