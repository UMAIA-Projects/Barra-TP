import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/planning_model.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const BarraTPApp());
}

class BarraTPApp extends StatelessWidget {
  const BarraTPApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlanningState(),
        ),
      ],
      child: MaterialApp(
        title: 'BARRA TP',
        theme: AppTheme.lightTheme(),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
