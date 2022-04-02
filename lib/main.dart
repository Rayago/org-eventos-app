import 'package:flutter/material.dart';
import 'telaLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de login',
      debugShowCheckedModeBanner: false,
      home: TelaLogin()
    );
  }
}