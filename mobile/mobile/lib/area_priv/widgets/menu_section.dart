import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../meus_bilhetes_planeamento/screens/home_screen.dart' as MeusBilhetes;
import '../../passes/screens/home_screen.dart' as Passes;
import '../../historico_viagens/screens/home_screen.dart' as HistoricoViagens;
import '../../historico_viagens/providers/trip_provider.dart';
import '../../definiçoes_conta/screens/account_settings_screen.dart' as DefinicoesConta;
import '../../definiçoes_conta/providers/account_provider.dart';

class MenuItem {
  final String label;
  final IconData icon;
  final String route;

  MenuItem({
    required this.label,
    required this.icon,
    required this.route,
  });
}

final menuItems = [
  MenuItem(
    label: 'Os Meus Bilhetes e Planeamentos',
    icon: Icons.airplane_ticket,
    route: '/meus_bilhetes',
  ),
  MenuItem(
    label: 'Os Meus Passes',
    icon: Icons.credit_card,
    route: '/passes',
  ),
  MenuItem(
    label: 'Histórico de Viagens e Multas',
    icon: Icons.history,
    route: '/historico_viagens',
  ),
  MenuItem(
    label: 'Definições de Conta',
    icon: Icons.person_outline,
    route: '/definicoes_conta',
  ),
];

class MenuSection extends StatelessWidget {
  const MenuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8.0 : 16.0,
        vertical: isMobile ? 12.0 : 16.0,
      ),
      child: Column(
        children: List.generate(
          menuItems.length,
          (index) => Padding(
            padding: EdgeInsets.only(
              bottom: index < menuItems.length - 1 ? 8.0 : 0,
            ),
            child: _MenuItemWidget(
              item: menuItems[index],
              isMobile: isMobile,
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuItemWidget extends StatelessWidget {
  final MenuItem item;
  final bool isMobile;

  const _MenuItemWidget({
    required this.item,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (item.route) {
          case '/meus_bilhetes':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MeusBilhetes.HomeScreen()),
            );
            break;
          case '/passes':
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Passes.HomeScreen()),
            );
            break;
          case '/historico_viagens':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider(
                  create: (_) => TripProvider(),
                  child: const HistoricoViagens.HomeScreen(),
                ),
              ),
            );
            break;
          case '/definicoes_conta':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChangeNotifierProvider(
                  create: (_) => AccountProvider(),
                  child: const DefinicoesConta.AccountSettingsScreen(),
                ),
              ),
            );
            break;
          default:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Navigating to ${item.route}')),
            );
        }
      },
      child: Container(
        height: isMobile ? 50 : 60,
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(
                item.icon,
                size: isMobile ? 20 : 23,
                color: const Color(0xFF365F67),
              ),
              SizedBox(width: isMobile ? 12 : 16),
              Expanded(
                child: Text(
                  item.label,
                  style: TextStyle(
                    fontFamily: 'DaysOne',
                    fontSize: isMobile ? 16 : 18,
                    color: const Color(0xFF365F67),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
