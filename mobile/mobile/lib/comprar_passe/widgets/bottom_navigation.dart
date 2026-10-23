import 'package:flutter/material.dart';
import '../constants/colors.dart';

class BarraBottomNavigation extends StatelessWidget {
  const BarraBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BarraColors.primary,
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _NavItem(
            icon: Icons.home,
            onTap: () {},
          ),
          _NavItem(
            icon: Icons.location_on,
            onTap: () {},
          ),
          _NavItem(
            icon: Icons.alt_route,
            onTap: () {},
          ),
          _NavItem(
            icon: Icons.person,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
