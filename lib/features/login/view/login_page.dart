import 'package:flutter/material.dart';
import 'package:practicetask/features/login/service/login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            TextFormField(
              controller: LoginService().emailController,
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'Email',
              ),
              validator: (String? email) {
                return (email != null && email.isNotEmpty)
                    ? null
                    : 'Enter the email';
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: LoginService().passwordController,

              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                hintText: 'Password',
              ),
              validator: (String? password) {
                return (password != null && password.isNotEmpty)
                    ? null
                    : 'Enter the password';
              },
            ),

            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // if (LoginService().formKey.currentState!.validate()) {
                  LoginService().loginFunction(
                    username: LoginService().emailController.text,
                    password: LoginService().passwordController.text,
                    context: context,
                  );
                  // }
                });
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
