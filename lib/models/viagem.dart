import 'package:untitled/models/endereco.dart';
import 'package:untitled/models/passageiro.dart';

class Viagem {
  Endereco inicio;
  Endereco fim;
  List<Passageiro> passageiros = [];

  Viagem(this.inicio, this.fim);

}