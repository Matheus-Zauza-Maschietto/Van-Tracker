import 'package:untitled/memory_db.dart';
import 'package:untitled/models/endereco.dart';
import 'package:untitled/models/estado.dart';
import 'package:untitled/models/municipio.dart';
import 'package:untitled/models/passageiro.dart';

class PassageiroService {

  void _cadastrar(
      String nome,
      int idade,
      String sexo,
      Estado estado,
      Municipio municipio,
      String bairro,
      String rua,
      String numero,
      String cep,
      String complemento
      ) {
    Endereco endereco =
        Endereco(estado, municipio, bairro, rua, numero, complemento);
    Passageiro passageiro = Passageiro(nome: nome, idade: idade, /*sexo: sexo*/);

    Memorydb.CurrentUser?.passageirosList.add(
      Passageiro(
        nome: nome,
        idade: idade,
        //sexo: sexo,
        //endereco: endereco,
      ),
    );
  }
}
