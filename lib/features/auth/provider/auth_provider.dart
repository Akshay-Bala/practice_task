import 'package:flutter/material.dart';
import 'package:practicetask/features/login/service/login_service.dart';

class AuthProvider extends ChangeNotifier {
  final LoginService _service = LoginService();

  bool _isLoggedIn = false;
  String? _loggedTime;
  String? _email;

  bool get isLoggedIn => _isLoggedIn;
  String? get loggedTime => _loggedTime;
  String? get email => _email;

  Future<bool> login(String username, String password) async {
    final result = await _service.loginFunction(username: username, password: password);
    if (result != null) {
      _isLoggedIn = true;
      _loggedTime = result;
      _email = username;
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _isLoggedIn = false;
    _loggedTime = null;
    _email = null;
    notifyListeners();
  }
}
