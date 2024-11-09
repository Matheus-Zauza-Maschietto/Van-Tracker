
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/lista_passageiro_widget.dart';

class PassageirosScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PassageirosScreen();
}

class _PassageirosScreen extends State<PassageirosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Passageiros')),
        body: ListaPassageiroWidget(),
    );
  }
}