import 'dart:math';

import 'package:untitled/constants/constants.dart';
import 'package:untitled/models/estado.dart';
import 'package:untitled/models/municipio.dart';

class Endereco {
  int id;
  int? estadoId;
  Estado? estado;
  int? municipioId;
  Municipio? municipio;
  String? bairro;
  String? rua;
  String? numero;
  String? complemento;
  String? cep;

  Endereco(
      {required this.id,
      this.estadoId,
      this.estado,
      this.municipioId,
      this.municipio,
      this.bairro,
      this.rua,
      this.numero,
      this.complemento,
      this.cep});

  factory Endereco.fromJson(Map<String, dynamic> json) {
    return Endereco(
        id: json['id'] is String ? int.parse(json['id']) : json['id'],
        estadoId: json['estadoId'],
        municipioId: json['municipioId'],
        bairro: json['bairro'],
        rua: json['rua'],
        numero: json['numero'],
        complemento: json['complemento'],
        cep: json['cep']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['estadoId'] = this.estadoId;
    data['municipioId'] = this.municipioId;
    data['bairro'] = this.bairro;
    data['rua'] = this.rua;
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    data['cep'] = this.cep;
    return data;
  }

  Map<String, dynamic> toNewJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = Random().nextInt(Constants.idMax);
    data['estadoId'] = this.estadoId;
    data['municipioId'] = this.municipioId;
    data['bairro'] = this.bairro;
    data['rua'] = this.rua;
    data['numero'] = this.numero;
    data['complemento'] = this.complemento;
    data['cep'] = this.cep;
    return data;
  }
}
