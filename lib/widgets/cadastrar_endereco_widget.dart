import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:untitled/models/endereco.dart';
import 'package:untitled/models/estado.dart';
import 'package:untitled/models/municipio.dart';
import 'package:untitled/patterns/dropdown-decoration.dart';
import 'package:untitled/repositories/endereco-repository.dart';
import 'package:untitled/services/endereco-service.dart';

class CadastrarEnderecoWidget extends StatefulWidget {
  CadastrarEnderecoWidget({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() => CadastrarEnderecoWidgetState();
}

class CadastrarEnderecoWidgetState extends State<CadastrarEnderecoWidget> {
  MaskedTextController cepController = MaskedTextController(mask: '00000-000');
  TextEditingController bairroController = TextEditingController();
  TextEditingController ruaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController complementoController = TextEditingController();
  EnderecoService enderecoService = EnderecoService(EnderecoRepository());
  final List<Estado> _estados = [];
  Estado? estadoSelecionado;
  final List<Municipio> _municipios = [];
  Municipio? municipioSelecionado;

  @override
  void initState() {
    super.initState();
    carregarEstados();
  }

  Future<void> carregarEstados() async {
    List<Estado> estados = await enderecoService.BuscarEstados();
    setState(() {
      _estados.addAll(estados);
    });
  }

  Future<void> carregarMunicipios(Estado estado) async {
    List<Municipio> municipios =
        await enderecoService.BuscarMunicipios(estado.id);
    setState(() {
      _municipios.clear();
      municipioSelecionado = null;
      _municipios.addAll(municipios);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _estados.isEmpty
                ? const CircularProgressIndicator()
                : Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    decoration: DropDownDecoration.boxDecoration,
                    child: DropdownButtonFormField<Estado>(
                      isExpanded: true,
                      value: estadoSelecionado,
                      hint: const Text('Selecione um estado'),
                      onChanged: (Estado? newValue) {
                        setState(() {
                          estadoSelecionado = newValue;
                        });
                        carregarMunicipios(estadoSelecionado!);
                      },
                      items: _estados
                          .map<DropdownMenuItem<Estado>>((Estado estado) {
                        return DropdownMenuItem<Estado>(
                          value: estado,
                          child: Text(estado.nome),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor preencha o Estado';
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
              child: _municipios.isEmpty
                  ? DropdownButtonFormField<Municipio>(
                      isExpanded: true,
                      value: municipioSelecionado,
                      hint: const Text('Selecione um estado acima'),
                      onChanged: (Municipio? newValue) {},
                      items: [
                        DropdownMenuItem(
                          value: Municipio(-1, "Selecione um estado acima"),
                          child: const Text("Selecione um estado acima"),
                        )
                      ],
                    )
                  : DropdownButtonFormField<Municipio>(
                      isExpanded: true,
                      value: municipioSelecionado,
                      hint: const Text('Selecione uma Cidade'),
                      onChanged: (Municipio? newValue) {
                        setState(() {
                          municipioSelecionado = newValue;
                        });
                      },
                      items: _municipios.map<DropdownMenuItem<Municipio>>(
                          (Municipio municipio) {
                        return DropdownMenuItem<Municipio>(
                          value: municipio,
                          child: Text(municipio.nome),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor preencha a Cidade';
                        }
                        return null;
                      },
                    ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: bairroController,
                decoration: const InputDecoration(labelText: 'Bairro'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor preencha o Bairro';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: ruaController,
                decoration: const InputDecoration(labelText: 'Rua'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor preencha a Rua';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: numeroController,
                decoration: const InputDecoration(labelText: 'Número'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor preencha o Número';
                  }
                  return null;
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: complementoController,
                  decoration: const InputDecoration(labelText: 'Complemento'),
                )),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextFormField(
                controller: cepController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'CEP',
                  hintText: '00000-000',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 9) {
                    return 'Por favor preencha o CEP';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
