import 'package:untitled/models/endereco.dart';

class Passageiro {
  final String nome;
  final int idade;
  final String sexo;
  final Endereco? endereco;

  Passageiro({
    required this.nome,
    required this.idade,
    required this.sexo,
    this.endereco,
  });
}