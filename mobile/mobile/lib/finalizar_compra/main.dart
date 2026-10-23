import 'package:flutter/material.dart';
import 'pages/checkout_page.dart';

void main() {
  runApp(const BarraTPApp());
}

class BarraTPApp extends StatelessWidget {
  const BarraTPApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barra TP',
      theme: ThemeData(
        primaryColor: const Color(0xFF365F67),
        useMaterial3: true,
        fontFamily: 'NunitoSans',
      ),
      home: const CheckoutPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
