import 'dart:convert';

import 'package:http/http.dart' as http;

class ViagensRepository {
  Future<List<dynamic>> BuscarViagens() async {
    var response = await http.get(Uri.parse("http://localhost:3001/viagens"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return [];
    }
  }
}