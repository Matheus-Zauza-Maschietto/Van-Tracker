import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widgets/passageiro_widget.dart';

class BottomMenuWidget extends StatefulWidget {
  const BottomMenuWidget({super.key});

  @override
  State<BottomMenuWidget> createState() =>
      _BottomMenuWidgetState();
}

class _BottomMenuWidgetState
    extends State<BottomMenuWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Em breve',
      style: optionStyle,
    ),
    Text(
      'Em breve',
      style: optionStyle,
    ),
    PassageiroWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Van Tracker'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Viagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Passageiros',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}