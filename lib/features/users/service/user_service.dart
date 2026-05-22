import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  final String userApi = "https://jsonplaceholder.typicode.com/users";

  Future<List<dynamic>> getRequest() async {
    final response = await http.get(Uri.parse(userApi));
    if (response.statusCode != 200) {
      return [];
    }
    final responseData = jsonDecode(response.body);
    if (responseData is List) {
      return responseData;
    }
    return [];
  }
}
