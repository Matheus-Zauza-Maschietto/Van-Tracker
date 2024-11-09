import 'package:flutter/material.dart';
import 'package:untitled/widgets/cadastro_passageiro_widget.dart';
import 'package:untitled/widgets/lista_passageiro_widget.dart';

class PassageiroWidget extends StatefulWidget {
  const PassageiroWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PassageiroWidgetState();
}

class _PassageiroWidgetState extends State<PassageiroWidget> {
  final GlobalKey<ListaPassageiroWidgetState> _listarPassageirosKey = GlobalKey();

  Future<void> _abrirCadastro() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => CadastroPassageiroWidget()),
    );
    _listarPassageirosKey.currentState!.CarregarPassageiros();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirCadastro,
        backgroundColor: Colors.grey.shade200,
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: ListaPassageiroWidget(key: _listarPassageirosKey),
    );
  }
}
