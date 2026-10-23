import 'package:flutter/material.dart';
import 'screens/discounts_screen.dart';
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
        primaryColor: AppColors.brandTeal,
        fontFamily: 'NunitoSans',
        useMaterial3: true,
      ),
      home: const DiscountsScreen(),
    );
  }
}
