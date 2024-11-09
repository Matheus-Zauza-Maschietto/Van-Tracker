import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/constants/sexo.dart';
import 'package:untitled/models/endereco.dart';
import 'package:untitled/models/passageiro.dart';
import 'package:untitled/patterns/dropdown-decoration.dart';
import 'package:untitled/repositories/endereco-repository.dart';
import 'package:untitled/repositories/passageiros-repository.dart';
import 'package:untitled/services/endereco-service.dart';
import 'package:untitled/services/passageiro-service.dart';
import 'package:untitled/widgets/cadastrar_endereco_widget.dart';
import 'package:untitled/widgets/editar_endereco_widget.dart';

class EditarPassageiroWidget {
  Passageiro passageiro;
  Endereco endereco;
  final passageiroService;
  final enderecoService;
  EditarPassageiroWidget(
      {required this.passageiro,
      required this.endereco,
      required this.enderecoService,
      required this.passageiroService});

  void editarPassageiro(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final GlobalKey<CadastrarEnderecoWidgetState> _enderecoKey = GlobalKey();
    final _nomeController = TextEditingController(text: passageiro.nome);
    final _idadeController = TextEditingController(text: passageiro.idade.toString());
    String? _sexoSelecionado = passageiro.sexo.toString();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Editar Passageiro"),
            content: SingleChildScrollView(
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
                            _sexoSelecionado = newValue!;
                          },
                          items: [
                            DropdownMenuItem(
                              child: Text("Masculino"),
                              value: Sexo.masculino.toString(),
                            ),
                            DropdownMenuItem(
                              child: Text("Feminino"),
                              value: Sexo.feminino.toString(),
                            ),
                            DropdownMenuItem(
                              child: Text("Outro"),
                              value: Sexo.outro.toString(),
                            )
                          ],
                          validator: (value) {
                            if (value == null) {
                              return 'Por favor preencha o Sexo';
                            }
                            return null;
                          },
                        ),
                      ),
                      EditarEnderecoWidget.editar(
                        key: _enderecoKey,
                        endereco: endereco,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
              actions: [
                TextButton(
                  child: Text('Salvar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text("Cancelar"),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                )
              ],
          );
        });
  }
}
