import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: BarraTPApp(),
    ),
  );
}

class BarraTPApp extends StatelessWidget {
  const BarraTPApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BARRA TP',
      theme: ThemeData(
        primaryColor: const Color(0xFF365F67),
        useMaterial3: true,
        fontFamily: 'NunitoSans',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF365F67),
          brightness: Brightness.light,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
