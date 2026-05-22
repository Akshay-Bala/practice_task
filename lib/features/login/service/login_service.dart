import 'package:flutter/material.dart';

class LoginService {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<Map<String, dynamic>> loginDetails = [
    {"email": "abc@gmail.com", "password": "abc@12345"},
  ];

  Future<String?> loginFunction({
    required String username,
    required String password,
  }) async {
    bool userFound = loginDetails.any(
      (user) => user['email'] == username && user['password'] == password,
    );
    if (userFound) {
      final String loggedTime = DateTime.now().toIso8601String();
      return loggedTime;
    }
    return null;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
