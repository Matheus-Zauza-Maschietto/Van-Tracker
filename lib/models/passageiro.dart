import 'package:untitled/enums/sexo.dart';
import 'package:untitled/models/endereco.dart';

class Passageiro {
  final String nome;
  final int idade;
  final Sexo? sexo;
  final Endereco? endereco;

  Passageiro({
    required this.nome,
    required this.idade,
    this.sexo,
    this.endereco,
  });

}