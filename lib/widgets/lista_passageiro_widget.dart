import 'package:flutter/material.dart';
import 'package:untitled/memory_db.dart';
import 'package:untitled/models/endereco.dart';
import 'package:untitled/models/passageiro.dart';
import 'package:untitled/repositories/endereco-repository.dart';
import 'package:untitled/repositories/passageiros-repository.dart';
import 'package:untitled/services/endereco-service.dart';
import 'package:untitled/services/passageiro-service.dart';
import 'package:untitled/widgets/editar_passageiro_widget.dart';

class ListaPassageiroWidget extends StatefulWidget {
  const ListaPassageiroWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ListaPassageiroWidgetState(PassageiroService(PassageiroRepository()), EnderecoService(EnderecoRepository()));
}

class ListaPassageiroWidgetState extends State<ListaPassageiroWidget> {
  PassageiroService _passageiroService;
  EnderecoService _enderecoService;
  ListaPassageiroWidgetState(this._passageiroService, this._enderecoService);
  final List<Passageiro> _passageiros = [];

  Future<void> CarregarPassageiros() async {
    List<Passageiro> passageiros = await _passageiroService.BuscarPassageiros();
    setState(() {
      _passageiros.clear();
      _passageiros.addAll(passageiros);
    });
  }

  @override
  void initState() {
    super.initState();
    CarregarPassageiros();
  }

  void DeletarPassageiros(Passageiro passageiro) async {
    Passageiro? passageiroDeletado = await _passageiroService.DeletarPassageiro(passageiro.id!);
    if(passageiroDeletado == null){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao deletar passageiro!')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Passageiro deletado com sucesso!')),
    );
    CarregarPassageiros();
  }

  void EditarPassageiros(Passageiro passageiro) async {
    Endereco endereco = await _enderecoService.BuscarEnderecosPorId(passageiro.enderecoId!);
    EditarPassageiroWidget(passageiro: passageiro, endereco: endereco, passageiroService: _passageiroService, enderecoService: _enderecoService)..editarPassageiro(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _passageiros.length,
      itemBuilder: (context, index) {
        final passageiro = _passageiros[index];
        return Card(
            child: Center(
              child: ListTile(
                title: Text(passageiro?.nome ?? "Passageiro não encontrado"),
                subtitle: Text('Idade: ${passageiro?.idade}, Sexo: ${passageiro?.sexo}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () => EditarPassageiros(passageiro), icon: Icon(Icons.edit), color: Colors.blue,),
                    IconButton(onPressed: () => DeletarPassageiros(passageiro), icon: Icon(Icons.delete), color: Colors.red,),
                  ],
                ),
              ),
            ),
        );
      },
    );
  }
}