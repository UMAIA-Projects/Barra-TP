import 'package:flutter/material.dart';
import 'package:desktop/constants/themes.dart';
import 'screens/area_privada_screen.dart';
import 'package:desktop/constants/routes.dart';


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
      home: const AreaprivadaScreen(),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
    );
  }
}
