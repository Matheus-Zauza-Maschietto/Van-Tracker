import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/models/user.dart';


class UserRepository {
  Future<List<dynamic>> BuscarUsers() async {
    var response = await http.get(Uri.parse("http://localhost:3001/users"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return [];
    }
  }

  Future<Map<String, dynamic>> CriarUser(Map<String, dynamic> usuario) async {
    var response = await http.post(Uri.parse("http://localhost:3001/users"), body: jsonEncode(usuario));
    if(response.statusCode == 201) {
      return await json.decode(response.body);
    }
    else {
      return {};
    }
  }
}