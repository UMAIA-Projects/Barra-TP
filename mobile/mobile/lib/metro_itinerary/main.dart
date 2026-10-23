import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/metro_screen.dart';
import 'theme/colors.dart';

void main() {
  runApp(const BarraMetroApp());
}

class BarraMetroApp extends StatelessWidget {
  const BarraMetroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barra TP',
      theme: ThemeData(
        primaryColor: AppColors.metroTeal,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: const MetroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
