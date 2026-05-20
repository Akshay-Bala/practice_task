import 'package:flutter/material.dart';
import 'package:practicetask/features/login/service/login_service.dart';
import 'package:practicetask/const/form_const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginService _loginService = LoginService();

  @override
  void dispose() {
    _loginService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _loginService.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _loginService.emailController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Email',
                ),
                validator: validateEmail,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _loginService.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: 'Password',
                ),
                validator: validatePassword,
              ),

              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (_loginService.formKey.currentState!.validate()) {
                    await _loginService.loginFunction(
                      username: _loginService.emailController.text,
                      password: _loginService.passwordController.text,
                      context: context,
                    );
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
