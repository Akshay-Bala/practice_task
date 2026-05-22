import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:practicetask/features/login/service/login_service.dart';
import 'package:practicetask/features/auth/provider/auth_provider.dart';
import 'package:practicetask/features/users/view/user_page.dart';
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
        child: Center(
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _loginService.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Welcome'),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _loginService.emailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _loginService.passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      validator: validatePassword,
                    ),
                    const SizedBox(height: 16),
                    Consumer<AuthProvider>(
                      builder: (context, auth, _) => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_loginService.formKey.currentState!.validate()) {
                              final success = await auth.login(
                                _loginService.emailController.text,
                                _loginService.passwordController.text,
                              );
                              if (success) {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Successfully Logged')));
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (_) => const UserPage()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login Unsuccessful')));
                              }
                            }
                          },
                          child: const Text('Login'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
