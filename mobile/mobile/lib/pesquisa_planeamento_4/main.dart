import 'package:flutter/material.dart';
import 'config/theme.dart';
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
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Wrapper para navegação
class PesquisaPlaneamento4App extends StatelessWidget {
  const PesquisaPlaneamento4App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BARRA TP',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
