import 'package:flutter/material.dart';

class PassageiroWidget extends StatefulWidget {
  const PassageiroWidget({super.key});

  @override
  State<StatefulWidget> createState() => _PassageiroWidgetState();
}

class _PassageiroWidgetState extends State<PassageiroWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.blueAccent,
        child: const Text(
          'Meu card'
        ),
      ),
    );
  }
}
