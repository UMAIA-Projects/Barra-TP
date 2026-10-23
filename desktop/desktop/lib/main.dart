import 'package:flutter/material.dart';
import 'package:desktop/constants/themes.dart';
import 'package:desktop/constants/routes.dart';
import 'package:desktop/Login/screens/login_screen.dart';

void main() {
  runApp(const BarraTPApp());
}

class BarraTPApp extends StatelessWidget {
  const BarraTPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BARRA TP',
      theme: AppTheme.lightTheme,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
