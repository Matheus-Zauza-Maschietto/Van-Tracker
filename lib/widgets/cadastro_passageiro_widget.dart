import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:untitled/models/estado.dart';
import 'package:untitled/models/municipio.dart';
import 'package:untitled/models/passageiro.dart';
import 'package:untitled/memory_db.dart';
import 'package:untitled/services/endereco-service.dart';

class CadastroPassageiroWidget extends StatefulWidget {
  const CadastroPassageiroWidget({super.key});

  @override
  _CadastroPassageiroWidget createState() => _CadastroPassageiroWidget();
}

class _CadastroPassageiroWidget extends State<CadastroPassageiroWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _idadeController = TextEditingController();
  final _cepController = MaskedTextController(mask: '00000-000');
  final _bairroController = TextEditingController();
  final _ruaController = TextEditingController();
  final _numeroController = TextEditingController();
  final _complementoController = TextEditingController();
  final _enderecoService = EnderecoService();
  String? _sexoSelecionado;
  List<Estado> _estados = [];
  Estado? _estadoSelecionado;
  List<Municipio> _municipios = [];
  Municipio? _municipioSelecionado;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    carregarEstados();
  }

  Future<void> carregarEstados() async {
    List<Estado> estados = await _enderecoService.buscarEstados();
    setState(() {
      _estados = estados;
    });
  }

  Future<void> carregarMunicipios(Estado estado) async {
    List<Municipio> municipios =
        await _enderecoService.buscarMunicipios(estado.id);
    setState(() {
      _municipios = [];
      _municipioSelecionado = null;
      _municipios = municipios;
    });
  }

  Widget _buscarDropdownEstados() {
    return _estados.isEmpty
        ? const CircularProgressIndicator()
        : Container(
            width: double.infinity, // Ocupa 100% da largura
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: DropdownButton<Estado>(
              isExpanded: true,
              value: _estadoSelecionado,
              hint: const Text('Selecione um estado'),
              onChanged: (Estado? newValue) {
                setState(() {
                  _estadoSelecionado = newValue;
                });
                carregarMunicipios(_estadoSelecionado!);
              },
              items: _estados.map<DropdownMenuItem<Estado>>((Estado estado) {
                return DropdownMenuItem<Estado>(
                  value: estado,
                  child: Text(estado.nome),
                );
              }).toList(),
            ),
          );
  }

  Widget _buscarDropdownSexo() {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: DropdownButton<String>(
          isExpanded: true,
          value: _sexoSelecionado,
          hint: const Text('Selecione um sexo'),
          onChanged: (String? newValue) {
            _sexoSelecionado = newValue;
          },
          items: const [
            DropdownMenuItem(
              value: "Masculino",
              child: Text("Masculino"),
            ),
            DropdownMenuItem(
              value: "Feminino",
              child: Text("Feminino"),
            ),
            DropdownMenuItem(
              value: "Outro",
              child: Text("Outro"),
            ),
          ],
        ));
  }

  Widget _buscarDropdownMunicipios() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
      ),
      child: _municipios.isEmpty
          ? DropdownButton<Municipio>(
              isExpanded: true,
              value: _municipioSelecionado,
              hint: const Text('Selecione um estado acima'),
              onChanged: (Municipio? newValue) {},
              items: [
                DropdownMenuItem(
                  value: Municipio(-1, "Selecione um estado acima"),
                  child: const Text("Selecione um estado acima"),
                )
              ],
            )
          : DropdownButton<Municipio>(
              isExpanded: true,
              value: _municipioSelecionado,
              hint: const Text('Selecione uma cidade'),
              onChanged: (Municipio? newValue) {
                setState(() {
                  _municipioSelecionado = newValue;
                });
              },
              items: _municipios
                  .map<DropdownMenuItem<Municipio>>((Municipio municipio) {
                return DropdownMenuItem<Municipio>(
                  value: municipio,
                  child: Text(municipio.nome),
                );
              }).toList(),
            ),
    );
  }

  void _cadastrar() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Formulário válido!')),
      );
    }
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
                _buscarDropdownSexo(),
                _buscarDropdownEstados(),
                _buscarDropdownMunicipios(),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _bairroController,
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
                    controller: _ruaController,
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
                    controller: _numeroController,
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
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _complementoController,
                      decoration:
                          const InputDecoration(labelText: 'Complemento'),
                    )),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _cepController,
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
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _cadastrar,
                  child: const Text('Cadastrar'),
                ),
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
