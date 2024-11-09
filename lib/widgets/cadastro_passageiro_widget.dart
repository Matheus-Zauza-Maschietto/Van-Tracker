import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:untitled/constants/constants.dart';
import 'package:untitled/constants/sexo.dart';
import 'package:untitled/models/endereco.dart';
import 'package:untitled/models/estado.dart';
import 'package:untitled/models/municipio.dart';
import 'package:untitled/models/passageiro.dart';
import 'package:untitled/patterns/dropdown-decoration.dart';
import 'package:untitled/repositories/endereco-repository.dart';
import 'package:untitled/repositories/passageiros-repository.dart';
import 'package:untitled/services/endereco-service.dart';
import 'package:untitled/services/passageiro-service.dart';
import 'package:untitled/widgets/cadastrar_endereco_widget.dart';

class CadastroPassageiroWidget extends StatefulWidget {
  const CadastroPassageiroWidget({super.key});

  @override
  _CadastroPassageiroWidget createState() => _CadastroPassageiroWidget();
}

class _CadastroPassageiroWidget extends State<CadastroPassageiroWidget> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<CadastrarEnderecoWidgetState> _enderecoKey = GlobalKey();
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  final _passageiroService = PassageiroService(PassageiroRepository());
  final _enderecoService = EnderecoService(EnderecoRepository());
  String? _sexoSelecionado;

  void _cadastrar() async {
    if (!_formKey.currentState!.validate()) {
      const SnackBar(content: Text('Formulário inválido!'));
    }

    Endereco novoEndereco = Endereco(
        id: Random().nextInt(Constants.idMax),
        estadoId: _enderecoKey.currentState!.estadoSelecionado!.id,
        municipioId: _enderecoKey.currentState!.municipioSelecionado!.id,
        bairro: _enderecoKey.currentState!.bairroController.text,
        rua: _enderecoKey.currentState!.ruaController.text,
        numero: _enderecoKey.currentState!.numeroController.text,
        complemento: _enderecoKey.currentState!.complementoController.text,
        cep: _enderecoKey.currentState!.cepController.text
    );
    Endereco endereco = await _enderecoService.CriarEndereco(novoEndereco);
    Passageiro novoPassageiro = Passageiro(
        id: Random().nextInt(Constants.idMax),
        nome: _nomeController.text,
        idade: int.parse(_idadeController.text),
        sexo: Sexo.values.firstWhere((p) => p.toString() == _sexoSelecionado),
        enderecoId: endereco.id
    );
    Passageiro passageiro =
        await _passageiroService.CriarPassageiro(novoPassageiro);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Passageiro cadastrado com sucesso!')),
    );

    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Passageiro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor preencha o Nome';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _idadeController,
                    decoration: const InputDecoration(labelText: 'Idade'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor preencha a Idade';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  decoration: DropDownDecoration.boxDecoration,
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: _sexoSelecionado,
                    hint: const Text('Selecione um sexo'),
                    onChanged: (String? newValue) {
                      setState(() {
                        _sexoSelecionado = newValue!;
                      });
                    },
                    items: [
                      DropdownMenuItem(child: Text("Masculino"), value: Sexo.masculino.toString(),),
                      DropdownMenuItem(child: Text("Feminino"), value: Sexo.feminino.toString(),),
                      DropdownMenuItem(child: Text("Outro"), value: Sexo.outro.toString(),)
                    ],
                    validator: (value) {
                      if (value == null) {
                        return 'Por favor preencha o Sexo';
                      }
                      return null;
                    },
                  ),
                ),
                CadastrarEnderecoWidget(
                  key: _enderecoKey,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _cadastrar,
                  child: const Text('Cadastrar'),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 100),
                      textStyle: const TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
