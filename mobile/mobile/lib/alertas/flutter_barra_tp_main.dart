import 'package:flutter/material.dart';
import 'flutter_screens_home_screen.dart';
import 'flutter_constants_colors.dart';

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
          seedColor: AppColors.tealdark,
          primary: AppColors.tealdark,
          secondary: AppColors.tealdark,
        ),
        fontFamily: 'NunitoSans',
      ),
      home: const HomeScreen(),
    );
  }
}
