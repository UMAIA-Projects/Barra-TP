import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'constants/app_colors.dart';

void main() {
  runApp(const BarraTpApp());
}

class BarraTpApp extends StatelessWidget {
  const BarraTpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BARRA TP',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.teal,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.teal,
          elevation: 0,
          titleTextStyle: GoogleFonts.daysOne(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
