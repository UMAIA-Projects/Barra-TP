import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../../../area_priv/screens/home_screen.dart' as AreaPrivScreen;

class BreadcrumbWidget extends StatelessWidget {
  const BreadcrumbWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: AppTheme.brandTealLight,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const AreaPrivScreen.HomeScreen(),
                ),
              );
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 8),
          Container(
            width: 32,
            height: 22,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Color.fromARGB(64, 0, 0, 0),
                ),
              ],
            ),
            child: const Icon(Icons.person, color: AppTheme.brandTeal, size: 20),
          ),
          const SizedBox(width: 8),
          const Text(
            'Área Privada',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'NunitoSans',
            ),
          ),
        ],
      ),
    );
  }
}
