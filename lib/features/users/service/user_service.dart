import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practicetask/features/users/models/model_users.dart';

class UserService {
  String userApi = "https://jsonplaceholder.typicode.com/users";

  Future<List<ModelUsers>> getRequest() async {
    final response = await http.get(Uri.parse(userApi));
    var responseData = jsonDecode(response.body);

    List<ModelUsers> users = [];
    for (var singleUser in responseData) {
      print("-------------------responseData-----------------------");
      print(responseData);
      print("-------------------responseData-----------------------");
      ModelUsers user = ModelUsers(
        id: singleUser["id"],
        name: singleUser["name"],
        phone: singleUser["phone"],
        email: singleUser['email'],
      );

      users.add(user);
    }
    return users;
  }
}
