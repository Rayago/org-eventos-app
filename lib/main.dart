import 'package:flutter/material.dart';
//import 'telaLogin.dart';
import 'onboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de login',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xff0000a2)),
      home: Onboard(),
    );
  }
}