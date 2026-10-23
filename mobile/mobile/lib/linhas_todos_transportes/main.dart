import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'constants/colors.dart';

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
        fontFamily: 'Nunito Sans',
        primaryColor: BarraTPColors.teal,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: BarraTPColors.teal,
          elevation: 4,
          shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontFamily: 'Days One',
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Nunito Sans',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: BarraTPColors.teal,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Nunito Sans',
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: BarraTPColors.teal,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
