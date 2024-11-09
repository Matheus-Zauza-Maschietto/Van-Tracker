import 'package:untitled/models/passageiro.dart';
import 'package:untitled/models/viagem.dart';

class PassageiroViagem {
  Passageiro? passageiro;
  int? passageiroId;
  Viagem? viagem;
  int? viagemId;
  bool checkinViagem = false;
  bool checkoutViagem = false;

  PassageiroViagem({this.passageiro, this.passageiroId, this.viagem, this.viagemId, required this.checkoutViagem, required this.checkinViagem});

  factory PassageiroViagem.fromJson(Map<String, dynamic> json) {
    return PassageiroViagem(passageiroId: json['passageiroId'], viagemId: json['viagemId'], checkinViagem: json['checkinViagem'], checkoutViagem: json['checkoutViagem']);
  }

  definirCheckin() {
    if(this.checkoutViagem) {
      throw Exception("Passsageiro já finalizou a viagem");
    }

    this.checkinViagem = true;

  }

  definirCheckout() {
    if(!this.checkinViagem){
      throw Exception("Passageiro não inicio a viagem");
    }
    this.checkoutViagem = true;
  }
}