import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:untitled/models/municipio.dart';
import 'package:untitled/repositories/endereco-repository.dart';
import 'package:untitled/services/endereco-service.dart';

class EnderecoRepositoryMockApi extends Mock implements EnderecoRepository {}

void main() {
  test('Realizar checkin viagem', () async {
    EnderecoRepositoryMockApi mock = EnderecoRepositoryMockApi();
    when(() => mock.buscarCidades(41)).thenAnswer((_) async => [
          {
            "id": 4126256,
            "nome": "Sarandi",
            "microrregiao": {
              "id": 41009,
              "nome": "Maringá",
            }
          }
        ]);

    EnderecoService enderecoService = EnderecoService(mock);
    List<Municipio> municipios = await enderecoService.buscarMunicipios(41);
    expect("Sarandi", municipios[0].nome);
  });
}
