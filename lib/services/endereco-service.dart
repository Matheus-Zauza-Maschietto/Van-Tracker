import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/models/estado.dart';
import 'package:untitled/models/municipio.dart';

class EnderecoService {

  Future<List<Estado>> buscarEstados() async
  {
    var response = await http.get(Uri.parse("https://servicodados.ibge.gov.br/api/v1/localidades/estados/"));

    if(response.statusCode == 200){
      List<dynamic> jsonResponse = await json.decode(response.body);
      return jsonResponse.map((estado) => Estado.fromJson(estado)).toList();
    }
    else{
      return [];
    }
  }

  Future<List<Municipio>> buscarMunicipios(int estadoId) async
  {
    var response = await http.get(Uri.parse("https://servicodados.ibge.gov.br/api/v1/localidades/estados/${estadoId.toString()}/municipios"));

    if(response.statusCode == 200){
      List<dynamic> jsonResponse = await json.decode(response.body);
      return jsonResponse.map((municipio) => Municipio.fromJson(municipio)).toList();
    }
    else{
      return [];
    }
  }

}