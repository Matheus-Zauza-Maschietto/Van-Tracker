import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/models/estado.dart';
import 'package:untitled/models/municipio.dart';
import 'package:untitled/repositories/endereco-repository.dart';

class EnderecoService {
  EnderecoRepository _enderecoRepository;
  EnderecoService(this._enderecoRepository);


  Future<List<Estado>> buscarEstados() async
  {
      var jsonResponse = await _enderecoRepository.buscarEstados();
      return jsonResponse.map((estado) => Estado.fromJson(estado)).toList();
  }

  Future<List<Municipio>> buscarMunicipios(int estadoId) async
  {
      List<dynamic> jsonResponse = await _enderecoRepository.buscarCidades(estadoId);
      return jsonResponse.map((municipio) => Municipio.fromJson(municipio)).toList();
  }

}