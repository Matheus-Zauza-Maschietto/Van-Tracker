import 'dart:convert';

import 'package:http/http.dart' as http;

class EnderecoRepository {

  Future<List<dynamic>> BuscarEstados() async {
    var response = await http.get(Uri.parse("https://servicodados.ibge.gov.br/api/v1/localidades/estados/"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return [];
    }
  }

  Future<Map<String, dynamic>> BuscarEstadoPorId(int estadoId) async {
    var response = await http.get(Uri.parse("https://servicodados.ibge.gov.br/api/v1/localidades/estados/$estadoId"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return {};
    }
  }

  Future<Map<String, dynamic>> BuscarCidadePorId(int cidadeId) async {
    var response = await http.get(Uri.parse("https://servicodados.ibge.gov.br/api/v1/localidades/municipios/$cidadeId"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return {};
    }
  }


  Future<List<dynamic>> BuscarCidades(int estadoId) async {
    var response = await http.get(Uri.parse("https://servicodados.ibge.gov.br/api/v1/localidades/estados/$estadoId/municipios"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return [];
    }
  }

  Future<List<dynamic>> BuscarEnderecos() async {
    var response = await http.get(Uri.parse("http://localhost:3001/enderecos"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return [];
    }
  }
  Future<Map<String, dynamic>> BuscarEnderecosPorId(int id) async {
    var response = await http.get(Uri.parse("http://localhost:3001/enderecos/$id"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return {};
    }
  }

  Future<Map<String, dynamic>> CriarEndereco(Map<String, dynamic> endereco) async {
    var response = await http.post(Uri.parse("http://localhost:3001/enderecos"), body: jsonEncode(endereco));
    if(response.statusCode == 201) {
      return await json.decode(response.body);
    }
    else {
      return {};
    }
  }

  Future<Map<String, dynamic>> DeletarEndereco(int id) async {
    var response = await http.delete(Uri.parse("http://localhost:3001/enderecos/$id"));
    if(response.statusCode == 200) {
      return await json.decode(response.body);
    }
    else {
      return {};
    }
  }
}