import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const BarraTPApp());
}

class BarraTPApp extends StatelessWidget {
  const BarraTPApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BARRA TP',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF365F67),
          brightness: Brightness.light,
        ),
        fontFamily: 'NunitoSans',
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
