import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/metro_provider.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const BarraTpApp());
}

class BarraTpApp extends StatelessWidget {
  const BarraTpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MetroProvider()),
      ],
      child: MaterialApp(
        title: 'BARRA TP',
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
