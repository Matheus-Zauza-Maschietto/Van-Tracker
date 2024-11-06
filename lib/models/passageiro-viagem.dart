import 'package:untitled/models/passageiro.dart';
import 'package:untitled/models/viagem.dart';

class PassageiroViagem {
  Passageiro passageiro;
  Viagem viagem;
  bool checkinViagem = false;
  bool checkoutViagem = false;

  PassageiroViagem(this.passageiro, this.viagem);

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