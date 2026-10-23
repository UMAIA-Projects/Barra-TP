import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: AppColors.teal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavButton(
            icon: Icons.home_outlined,
            onTap: () {},
          ),
          _NavButton(
            icon: Icons.location_on_outlined,
            onTap: () {},
          ),
          _NavButton(
            icon: Icons.route_outlined,
            onTap: () {},
          ),
          _NavButton(
            icon: Icons.person_outline,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Icon(
          icon,
          color: Colors.white,
          size: 40,
          shadows: [
            Shadow(
              color: Colors.black.withValues(alpha: 0.25),
              offset: const Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
      ),
    );
  }
}
