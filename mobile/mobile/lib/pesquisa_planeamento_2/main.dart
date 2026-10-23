import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RouteProvider()),
      ],
      child: const BarraTPApp(),
    ),
  );
}

class BarraTPApp extends StatelessWidget {
  const BarraTPApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BARRA TP',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RouteProvider extends ChangeNotifier {
  String _origin = 'Mandim';
  String _destination = 'Universidade da Maia - UMaia';
  String _selectedMode = 'bus';

  String get origin => _origin;
  String get destination => _destination;
  String get selectedMode => _selectedMode;

  void setOrigin(String value) {
    _origin = value;
    notifyListeners();
  }

  void setDestination(String value) {
    _destination = value;
    notifyListeners();
  }

  void setSelectedMode(String mode) {
    _selectedMode = mode;
    notifyListeners();
  }

  void swapLocations() {
    final temp = _origin;
    _origin = _destination;
    _destination = temp;
    notifyListeners();
  }
}

// Wrapper para navegação
class PesquisaPlaneamento2App extends StatelessWidget {
  const PesquisaPlaneamento2App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RouteProvider()),
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
