import 'package:flutter/material.dart';
import 'package:untitled/memory_db.dart';

class ListaPassageiroWidget extends StatefulWidget {
  const ListaPassageiroWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ListaPassageiroWidget();
}

class _ListaPassageiroWidget extends State<ListaPassageiroWidget> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Memorydb.CurrentUser?.passageirosList.length,
      itemBuilder: (context, index) {
        final passageiro = Memorydb.CurrentUser?.passageirosList[index];
        return Card(
          child: SizedBox(
            width: 300,
            height: 100,
            child: Center(
              child: ListTile(
                title: Text(passageiro?.nome ?? "Passageiro não encontrado"),
                subtitle: Text('Idade: ${passageiro?.idade}, Sexo: ${passageiro?.sexo}, Endereço: ${passageiro?.endereco}'),
              ),
            ),
          ),
        );

      },
    );
  }
}