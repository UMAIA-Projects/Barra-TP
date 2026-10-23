import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/route_provider.dart';
import 'screens/transit_screen.dart';
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
        ChangeNotifierProvider(create: (_) => RoutePlanningProvider()),
      ],
      child: MaterialApp(
        title: 'BARRA TP',
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        home: const TransitScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// Wrapper para navegação
class PesquisaPlaneamento3App extends StatelessWidget {
  const PesquisaPlaneamento3App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RoutePlanningProvider()),
      ],
      child: MaterialApp(
        title: 'BARRA TP',
        theme: AppTheme.lightTheme,
        themeMode: ThemeMode.light,
        home: const TransitScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
