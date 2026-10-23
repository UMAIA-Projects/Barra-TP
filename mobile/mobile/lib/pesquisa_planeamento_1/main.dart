import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/route_provider.dart';
import 'theme/app_colors.dart';
import 'screens/home_screen.dart';
import 'screens/placeholder_screen.dart';

void main() {
  runApp(const BarraTPApp());
}

class BarraTPApp extends StatelessWidget {
  const BarraTPApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RouteProvider()),
      ],
      child: MaterialApp(
        title: 'BARRA TP',
        theme: AppTheme.lightTheme(),
        home: const MainNavigationScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  void _onNavigate(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
Widget build(BuildContext context) {
  return PopScope(
    // canPop define se o gesto de "voltar" do sistema pode fechar a app/ecrã.
    // Se o índice for 0, permitimos o pop (fechar a app). 
    // Se não for 0, bloqueamos o pop para mudar de aba primeiro.
    canPop: _selectedIndex == 0, 

    onPopInvokedWithResult: (didPop, result) {
      // didPop indica se o pop já aconteceu (se o sistema fechou o ecrã)
      if (didPop) {
        return;
      }

      // Se chegamos aqui e didPop é false, significa que canPop era false.
      // Então executamos a tua lógica de voltar para a Home (index 0).
      if (_selectedIndex != 0) {
        _onNavigate(0);
      }
    },
    child: IndexedStack(
      index: _selectedIndex,
      children: [
        HomeScreen(onNavigate: _onNavigate),
        PlaceholderScreen(
          title: 'Localização',
          selectedIndex: 1,
          onNavigate: _onNavigate,
        ),
        PlaceholderScreen(
          title: 'Rotas',
          selectedIndex: 2,
          onNavigate: _onNavigate,
        ),
        PlaceholderScreen(
          title: 'Consulta de Bilhetes',
          selectedIndex: 3,
          onNavigate: _onNavigate,
        ),
      ],
    ),
  );
}
}

// Wrapper para navegação
class PesquisaPlaneamento1App extends StatelessWidget {
  const PesquisaPlaneamento1App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RouteProvider()),
      ],
      child: MaterialApp(
        title: 'BARRA TP',
        theme: AppTheme.lightTheme(),
        home: const MainNavigationScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}