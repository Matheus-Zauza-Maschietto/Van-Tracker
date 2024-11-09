import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled/models/endereco.dart';
import 'package:untitled/models/estado.dart';
import 'package:untitled/models/municipio.dart';
import 'package:untitled/repositories/endereco-repository.dart';

class EnderecoService {
  EnderecoRepository _enderecoRepository;
  EnderecoService(this._enderecoRepository);


  Future<List<Estado>> BuscarEstados() async
  {
      var jsonResponse = await _enderecoRepository.BuscarEstados();
      return jsonResponse.map((estado) => Estado.fromJson(estado)).toList();
  }

  Future<Estado> BuscarEstadoPorId(int id) async
  {
    var jsonResponse = await _enderecoRepository.BuscarEstadoPorId(id);
    return Estado.fromJson(jsonResponse);
  }

  Future<Municipio> BuscarMunicipioPorId(int id) async
  {
    var jsonResponse = await _enderecoRepository.BuscarCidadePorId(id);
    return Municipio.fromJson(jsonResponse);
  }

  Future<List<Municipio>> BuscarMunicipios(int estadoId) async
  {
      List<dynamic> jsonResponse = await _enderecoRepository.BuscarCidades(estadoId);
      return jsonResponse.map((municipio) => Municipio.fromJson(municipio)).toList();
  }

  Future<List<Endereco>> BuscarEnderecos() async {
    List<dynamic> jsonResponse = await _enderecoRepository.BuscarEnderecos();
    return jsonResponse.map((endereco) => Endereco.fromJson(endereco)).toList();
  }

  Future<Endereco> BuscarEnderecosPorId(int id) async {
    Map<String, dynamic> jsonResponse = await _enderecoRepository.BuscarEnderecosPorId(id);
    return Endereco.fromJson(jsonResponse);
  }

  Future<Endereco> CriarEndereco(Endereco endereco) async {
    var json = endereco.toNewJson();
    Map<String, dynamic> jsonResponse = await _enderecoRepository.CriarEndereco(json);
    return Endereco.fromJson(jsonResponse);
  }

  Future<Endereco> DeletarEndereco(int id) async {
    Map<String, dynamic> jsonResponse = await _enderecoRepository.DeletarEndereco(id);
    return Endereco.fromJson(jsonResponse);
  }

  Future<Endereco> EditarEndereco(Endereco endereco, int id) async {
    await DeletarEndereco(id);
    return await CriarEndereco(endereco);
  }
}