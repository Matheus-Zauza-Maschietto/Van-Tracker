import 'passageiro.dart';

class User {
  String email;
  String senha;
  String nome;
  List<Passageiro> passageirosList = [];

  User({required this.email, required this.senha, required this.nome});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(email: json['email'], senha: json['senha'], nome: json['nome']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['nome'] = this.nome;
    return data;
  }
}