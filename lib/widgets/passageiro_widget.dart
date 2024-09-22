import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassageiroWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _PassageiroWidgetState();
}

class _PassageiroWidgetState extends State<PassageiroWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.blueAccent,
        child: Text(
          'Meu card'
        ),
      ),
    );
  }
}
