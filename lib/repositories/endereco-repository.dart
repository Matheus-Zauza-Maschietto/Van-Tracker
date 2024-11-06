import 'dart:convert';

import 'package:http/http.dart' as http;

class EnderecoRepository {

  Future<List<dynamic>> buscarEstados() async {
    var response = await http.get(Uri.parse("https://servicodados.ibge.gov.br/api/v1/localidades/estados/"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return [];
    }
  }

  Future<List<dynamic>> buscarCidades(int estadoId) async {
    var response = await http.get(Uri.parse("https://servicodados.ibge.gov.br/api/v1/localidades/estados/$estadoId/municipios"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return [];
    }
  }


}