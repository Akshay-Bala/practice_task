import 'package:flutter/material.dart';
import 'package:practicetask/features/users/service/user_service.dart';

class UserProvider extends ChangeNotifier {
  final UserService _service = UserService();

  List<dynamic> _users = [];
  bool _loading = false;

  List<dynamic> get users => _users;
  bool get loading => _loading;

  Future<void> fetchUsers() async {
    _loading = true;
    notifyListeners();
    final result = await _service.getRequest();
    _users = result;
    _loading = false;
    notifyListeners();
  }
}
