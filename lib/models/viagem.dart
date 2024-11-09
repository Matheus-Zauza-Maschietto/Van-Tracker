import 'package:untitled/models/endereco.dart';
import 'package:untitled/models/passageiro-viagem.dart';
import 'package:untitled/models/passageiro.dart';

class Viagem {
  Endereco inicio;
  Endereco fim;
  List<PassageiroViagem> passageiros = [];

  Viagem(this.inicio, this.fim);

}