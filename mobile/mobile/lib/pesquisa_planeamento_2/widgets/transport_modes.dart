import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import '../theme/app_theme.dart';
import '../../pesquisa_planeamento_1/main.dart' as p1;
import '../../pesquisa_planeamento_3/main.dart' as p3;
import '../../pesquisa_planeamento_4/main.dart' as p4;

class TransportModes extends StatelessWidget {
  const TransportModes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RouteProvider>(
      builder: (context, routeProvider, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TransportModeButton(
                icon: Icons.directions_car,
                label: '6 min',
                mode: 'car',
                isSelected: routeProvider.selectedMode == 'car',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const p1.PesquisaPlaneamento1App(),
                    ),
                  );
                },
              ),

              // 👉 Espaçamento substituindo "gap: 20"
              const SizedBox(width: 20),

              _TransportModeButton(
                icon: Icons.directions_bus,
                label: '7 min',
                mode: 'bus',
                isSelected: routeProvider.selectedMode == 'bus',
                onTap: () {
                  // Segundo botão - já está em pesquisa_planeamento_2
                  routeProvider.setSelectedMode('bus');
                },
              ),

              const SizedBox(width: 20),

              _TransportModeButton(
                icon: Icons.directions_walk,
                label: '31 min',
                mode: 'walk',
                isSelected: routeProvider.selectedMode == 'walk',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const p3.PesquisaPlaneamento3App(),
                    ),
                  );
                },
              ),

              const SizedBox(width: 20),

              _TransportModeButton(
                icon: Icons.directions_bike,
                label: '9 min',
                mode: 'bike',
                isSelected: routeProvider.selectedMode == 'bike',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const p4.PesquisaPlaneamento4App(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _TransportModeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String mode;
  final bool isSelected;
  final VoidCallback onTap;

  const _TransportModeButton({
    required this.icon,
    required this.label,
    required this.mode,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black54),
              color: isSelected ? AppColors.gray : AppColors.darkGray,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: isSelected ? AppColors.primary : Colors.white,
              size: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.nunitoSans(
              fontSize: 9,
              fontWeight: FontWeight.w200,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
