import 'package:flutter/material.dart';
import 'package:untitled/Models/passageiro.dart';
import 'package:untitled/memory_db.dart';

class CadastroPassageiroWidget extends StatefulWidget {
  @override
  _CadastroPassageiroWidget createState() => _CadastroPassageiroWidget();
}

class _CadastroPassageiroWidget extends State<CadastroPassageiroWidget> {
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  final _sexoController = TextEditingController();
  final _enderecoController = TextEditingController();
  String errorMessage = '';

  void _cadastrar() {
    String nome = _nomeController.text;
    int? idade = int.tryParse(_idadeController.text);
    String sexo = _sexoController.text;
    String endereco = _enderecoController.text;

    if (nome.isNotEmpty && idade != null && sexo.isNotEmpty && endereco.isNotEmpty) {
      // Adiciona o novo passageiro à lista
      Memorydb.CurrentUser?.passageirosList.add(Passageiro(
        nome: nome,
        idade: idade,
        sexo: sexo,
        endereco: endereco,
      ));

      // Volta para a página anterior
      Navigator.pop(context);
    } else {
      setState(() {
        errorMessage = 'Por favor, preencha todos os campos corretamente';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Passageiro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _idadeController,
              decoration: InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _sexoController,
              decoration: InputDecoration(labelText: 'Sexo'),
            ),
            TextField(
              controller: _enderecoController,
              decoration: InputDecoration(labelText: 'Endereço'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _cadastrar,
              child: Text('Cadastrar'),
            ),
            if (errorMessage.isNotEmpty)
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}