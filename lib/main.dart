import 'package:flutter/material.dart';
import 'package:untitled/screens/login_screen.dart';

void main() {
  runApp(const VanTracker());
}

class VanTracker extends StatelessWidget {
  const VanTracker({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Van Tracker',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
