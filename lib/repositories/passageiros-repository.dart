import 'dart:convert';

import 'package:http/http.dart' as http;

class PassageiroRepository {
  Future<List<dynamic>> BuscarPassageiros() async {
    var response = await http.get(Uri.parse("http://localhost:3001/passageiros"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return [];
    }
  }

  Future<Map<String, dynamic>> BuscarPassageiroPorId(int id) async {
    var response = await http.get(Uri.parse("http://localhost:3001/passageiros/$id"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return {};
    }
  }

  Future<Map<String, dynamic>> CriarPassageiro(Map<String, dynamic> passageiroJson) async {
    var response = await http.post(Uri.parse("http://localhost:3001/passageiros"), body: jsonEncode(passageiroJson));
    if(response.statusCode == 201) {
      return await json.decode(response.body);
    }
    else {
      return {};
    }
  }

  Future<Map<String, dynamic>> DeletarPassageiro(int passageiroId) async {
    var response = await http.delete(Uri.parse("http://localhost:3001/passageiros/$passageiroId"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return {};
    }
  }
}