// import 'package:flutter_test/flutter_test.dart';
// import 'package:untitled/enums/sexo.dart';
// import 'package:untitled/models/endereco.dart';
// import 'package:untitled/models/estado.dart';
// import 'package:untitled/models/municipio.dart';
// import 'package:untitled/models/passageiro-viagem.dart';
// import 'package:untitled/models/passageiro.dart';
// import 'package:untitled/models/viagem.dart';
//
// void main() {
//   test('Realizar checkin viagem', () {
//     Endereco inicio = Endereco(Estado(1, 'Paraná'), Municipio(1, 'Maringá'),
//     'Zona 07', 'Rua cantor erinaldo', '10', '');
//     Endereco fim = Endereco(Estado(1, 'Paraná'), Municipio(1, 'Maringá'),
//         'Zona 07', 'Rua cantor raul seixas', '10', '');
//     Passageiro passageiro = Passageiro(
//       nome: "Eduardo",
//       idade: 19,
//       sexo: Sexo.feminino,
//       endereco: inicio,
//     );
//     Viagem viagem = Viagem(inicio, fim);
//     PassageiroViagem passageiroViagem = PassageiroViagem(passageiro, viagem);
//
//     passageiroViagem.definirCheckin();
//
//     expect(passageiroViagem.checkinViagem, true);
//   });
//
//   test('Realizar checkin e checkout viagem', () {
//     Endereco inicio = Endereco(Estado(1, 'Paraná'), Municipio(1, 'Maringá'),
//         'Zona 07', 'Rua cantor erinaldo', '10', '');
//     Endereco fim = Endereco(Estado(1, 'Paraná'), Municipio(1, 'Maringá'),
//         'Zona 07', 'Rua cantor raul seixas', '10', '');
//     Passageiro passageiro = Passageiro(
//       nome: "Eduardo",
//       idade: 19,
//       sexo: Sexo.feminino,
//       endereco: inicio,
//     );
//     Viagem viagem = Viagem(inicio, fim);
//     PassageiroViagem passageiroViagem = PassageiroViagem(passageiro, viagem);
//
//     passageiroViagem.definirCheckin();
//     passageiroViagem.definirCheckout();
//
//     expect(passageiroViagem.checkoutViagem, true);
//   });
// }
