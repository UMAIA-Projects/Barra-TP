import 'package:flutter/material.dart';
import 'carregamento_passe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carregamento Passe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: CarregamentoPasse(),
      debugShowCheckedModeBanner: false,
    );
  }
}
