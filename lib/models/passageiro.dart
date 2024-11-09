import 'dart:math';

import 'package:untitled/constants/constants.dart';
import 'package:untitled/constants/sexo.dart';
import 'package:untitled/models/endereco.dart';
import 'package:untitled/models/passageiro-viagem.dart';

class Passageiro {
  final int? id;
  final String nome;
  final int idade;
  final Sexo? sexo;
  int? enderecoId;
  Endereco? endereco;
  List<PassageiroViagem> viagens = [];

  Passageiro({
    this.id,
    required this.nome,
    required this.idade,
    this.sexo,
    this.endereco,
    this.enderecoId
  });

  factory Passageiro.fromJson(Map<String, dynamic> json){
    Sexo sexoApi;
    if(json['sexo'] == 1)
      sexoApi = Sexo.masculino;
    else if(json['sexo'] == 2)
      sexoApi = Sexo.feminino;
    else
      sexoApi = Sexo.outro;

    return Passageiro(id: json['id'] is String ? int.parse(json['id']) : json['id'], nome: json['nome'], idade: json['idade'], sexo: sexoApi, enderecoId: json['enderecoId']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['idade'] = this.idade;
    data['enderecoId'] = this.enderecoId;

    if(sexo == Sexo.masculino)
      data['sexo'] = 1;
    else if(sexo == Sexo.feminino)
      data['sexo'] = 2;
    else
      data['sexo'] = 3;

    return data;
  }

  Map<String, dynamic> toNewJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = Random().nextInt(Constants.idMax);
    data['nome'] = this.nome;
    data['idade'] = this.idade;
    data['enderecoId'] = this.enderecoId;

    if(sexo == Sexo.masculino)
      data['sexo'] = 1;
    else if(sexo == Sexo.feminino)
      data['sexo'] = 2;
    else
      data['sexo'] = 3;

    return data;
  }

}