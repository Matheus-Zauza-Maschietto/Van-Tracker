import 'package:untitled/memory_db.dart';
import 'package:untitled/models/endereco.dart';
import 'package:untitled/models/estado.dart';
import 'package:untitled/models/municipio.dart';
import 'package:untitled/models/passageiro.dart';
import 'package:untitled/repositories/passageiros-repository.dart';

class PassageiroService {
  PassageiroRepository _passageiroRepository;

  PassageiroService(this._passageiroRepository);

  Future<List<Passageiro>> BuscarPassageiros() async {
    var jsonResponse = await _passageiroRepository.BuscarPassageiros();
    return jsonResponse.map((p) => Passageiro.fromJson(p)).toList();
  }

  Future<Passageiro> BuscarPassageiroPorId(int id) async {
    var jsonResponse = await _passageiroRepository.BuscarPassageiroPorId(id);
    return Passageiro.fromJson(jsonResponse);
  }

  Future<Passageiro> CriarPassageiro(Passageiro passageiro) async {
    var json = passageiro.toJson();
    var jsonResponse = await _passageiroRepository.CriarPassageiro(json);
    return Passageiro.fromJson(jsonResponse);
  }

  Future<Passageiro> DeletarPassageiro(int id) async {
    var jsonResponse = await _passageiroRepository.DeletarPassageiro(id);
    return Passageiro.fromJson(jsonResponse);
  }


  Future<Passageiro> AtualizarPassageiro(Passageiro passageiroEditado, int id) async {
    await DeletarPassageiro(id);
    return await CriarPassageiro(passageiroEditado);
  }
}
