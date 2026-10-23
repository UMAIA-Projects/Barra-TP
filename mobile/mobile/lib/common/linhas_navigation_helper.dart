import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../alertas/flutter_screens_home_screen.dart' as AlertasScreen;
import '../linhas_fav/screens/home_screen.dart' as FavoritosScreen;
import '../linhas_todos_transportes/screens/home_screen.dart' as TodosScreen;
import '../linhas_autocarro/screens/home_screen.dart' as AutocarroScreen;
import '../linhas_autocarro/providers/app_state.dart';
import '../linhas_comboio/screens/home_screen.dart' as ComboioScreen;
import '../linhas_metro/screens/home_screen.dart' as MetroScreen;
import '../linhas_metro/providers/navigation_provider.dart';
import '../stcp_itinerary/main.dart' as StcpItinerary;
import '../cp_itinerary/itinerary_page.dart' as CpItinerary;
import '../metro_itinerary/main.dart' as MetroItinerary;
import '../pesquisa_metro/screens/home_screen.dart' as PesquisaMetro;
import '../pesquisa_metro/providers/metro_provider.dart';

class LinhasNavigationHelper {
  static void navigateToTab(BuildContext context, String tab) {
    switch (tab) {
      case 'alertas':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AlertasScreen.HomeScreen()),
        );
        break;
      case 'favoritos':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const FavoritosScreen.HomeScreen()),
        );
        break;
      case 'todos':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const TodosScreen.HomeScreen()),
        );
        break;
      case 'autocarro':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => provider.ChangeNotifierProvider(
              create: (_) => AppState(),
              child: const AutocarroScreen.HomeScreen(),
            ),
          ),
        );
        break;
      case 'comboio':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => ProviderScope(
              child: const ComboioScreen.HomeScreen(),
            ),
          ),
        );
        break;
      case 'metro':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => provider.ChangeNotifierProvider(
              create: (_) => NavigationProvider(),
              child: const MetroScreen.HomeScreen(),
            ),
          ),
        );
        break;
    }
  }

  static void navigateToStcpItinerary(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const StcpItinerary.MainNavigation()),
    );
  }

  static void navigateToCpItinerary(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CpItinerary.ItineraryPage()),
    );
  }

  static void navigateToMetroItinerary(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const MetroItinerary.BarraMetroApp()),
    );
  }

  static void navigateToPesquisaMetro(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => provider.ChangeNotifierProvider(
        create: (_) => MetroProvider(),
        child: const PesquisaMetro.HomeScreen(),
      )),
    );
  }
}
