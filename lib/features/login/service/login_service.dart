import 'package:flutter/material.dart';
import 'package:practicetask/features/users/view/user_page.dart';

class LoginService {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<Map<String, dynamic>> loginDetails = [
    {"email": "abc@gmail.com", "password": "abc@12345"},
  ];

  Future<void> loginFunction({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    bool userFound = loginDetails.any(
      (user) => user['email'] == username && user['password'] == password,
    );
    if (userFound) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserPage()),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Succesfully Logged")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Unsuccessful")));
    }
  }
}
