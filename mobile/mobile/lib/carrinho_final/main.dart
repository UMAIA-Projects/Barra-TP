import 'package:flutter/material.dart';
import 'screens/cart_verification_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const BarraTpApp());
}

class BarraTpApp extends StatelessWidget {
  const BarraTpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BARRA TP',
      theme: AppTheme.lightTheme,
      home: const CartVerificationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
