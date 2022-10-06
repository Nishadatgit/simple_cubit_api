import 'dart:convert';

import 'package:cubit_equatable/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  String endpoint = "https://reqres.in/api/users?page=2";

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
