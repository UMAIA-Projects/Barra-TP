import 'package:flutter/material.dart';
import '../constants/colors.dart';

class BarraHeader extends StatelessWidget {
  const BarraHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top protection bar
        Container(
          height: 64,
          color: BarraColors.primary,
        ),
        // Main header
        Container(
          color: BarraColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Hamburger menu
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 24),
                onPressed: () {},
              ),
              // Logo
              Text(
                'BARRA TP',
                style: BarraTheme.headingLarge.copyWith(fontSize: 36),
              ),
              // Location icon
              IconButton(
                icon: const Icon(Icons.location_on, color: Colors.white, size: 28),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SubHeader extends StatelessWidget {
  final String label;

  const SubHeader({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF407079),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                const Icon(Icons.badge, color: BarraColors.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Passe Digital',
                  style: BarraTheme.bodySmall.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabBar extends StatelessWidget {
  const TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF407079),
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: BarraColors.primary,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Text(
          'Comprar Passe',
          style: TextStyle(
            fontFamily: 'DaysOne',
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
