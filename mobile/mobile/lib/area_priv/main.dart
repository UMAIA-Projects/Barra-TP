import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

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
        primaryColor: const Color(0xFF365F67),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'DaysOne',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF365F67),
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
