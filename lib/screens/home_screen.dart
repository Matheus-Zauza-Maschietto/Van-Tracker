import 'package:flutter/material.dart';
import 'package:untitled/repositories/endereco-repository.dart';
import 'package:untitled/services/endereco-service.dart';
import 'package:untitled/widgets/bottom_menu_widget.dart';
import 'package:untitled/widgets/cadastrar_endereco_widget.dart';
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
    return BottomMenuWidget();
  }
}
