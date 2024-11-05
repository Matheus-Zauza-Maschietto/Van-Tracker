import 'package:flutter/material.dart';
import 'package:untitled/widgets/cadastro_passageiro_widget.dart';
import 'package:untitled/widgets/lista_passageiro_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Passageiros',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFFFFFFFF), width: 2),
            left: BorderSide(color: Color(0xFFFFFFFF), width: 2),
            right: BorderSide(color: Color(0xFFFFFFFF), width: 2),
            bottom: BorderSide(color: Color(0xFFFFFFFF), width: 2),
          ),
        ),
        child: const ListaPassageiroWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CadastroPassageiroWidget()),
          ).then((_) {
            setState(() {});
          });
        },
        tooltip: 'Adicionar Passageiro',
        child: const Icon(Icons.add),
      ),
    );
  }
}

