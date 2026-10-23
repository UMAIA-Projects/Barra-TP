import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home/home_page.dart';
import '../estacoesprox/screens/home_screen.dart' as estacoesprox;
import '../estacoesprox/providers/navigation_provider.dart';
import '../alertas/flutter_screens_home_screen.dart' as alertas;
import '../area_priv/screens/home_screen.dart' as area_priv;

class NavigationHelper {
  /// Navega para a página correspondente ao índice do bottom navigation bar
  /// 0: Home (home_page)
  /// 1: Estações Próximas (estacoesprox)
  /// 2: Alertas (alertas)
  /// 3: Área Privada (area_priv)
  static void navigateToPage(BuildContext context, int index) {
    Widget targetPage;
    
    switch (index) {
      case 0:
        // Home -> home_page
        targetPage = const HomePage();
        break;
      case 1:
        // Segundo botão -> estacoesprox
        targetPage = ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
          child: const estacoesprox.HomeScreen(),
        );
        break;
      case 2:
        // Terceiro botão -> alertas
        targetPage = const alertas.HomeScreen();
        break;
      case 3:
        // Quarto botão -> area_priv
        targetPage = const area_priv.HomeScreen();
        break;
      default:
        return;
    }
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => targetPage),
    );
  }
}
