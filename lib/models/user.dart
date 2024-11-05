import 'passageiro.dart';

class User {
  final String email;
  final String senha;
  final String nome;
  final List<Passageiro> passageirosList = [];

  User({required this.email, required this.senha, required this.nome});
}