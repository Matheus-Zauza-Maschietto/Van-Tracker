import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:untitled/Models/passageiro.dart';
import 'package:untitled/memory_db.dart';
import 'package:untitled/widgets/cadastro_passageiro_widget.dart';
import 'package:untitled/widgets/lista_passageiro_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Passageiros',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: ListaPassageiroWidget(),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFFFFFFFF), width: 2),
            left: BorderSide(color: Color(0xFFFFFFFF), width: 2),
            right: BorderSide(color: Color(0xFFFFFFFF), width: 2),
            bottom: BorderSide(color: Color(0xFFFFFFFF), width: 2),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CadastroPassageiroWidget()),
          ).then((_) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
        tooltip: 'Adicionar Passageiro',
      ),
    );
  }
}

