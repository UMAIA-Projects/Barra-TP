import 'package:flutter/material.dart';
import '../theme/colors.dart';

class BottomNav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;

  const BottomNav({
    Key? key,
    required this.selectedIndex,
    required this.onIndexChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: AppColors.metroTeal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home,
            isSelected: selectedIndex == 0,
            onTap: () => onIndexChanged(0),
          ),
          _NavItem(
            icon: Icons.location_on,
            isSelected: selectedIndex == 1,
            onTap: () => onIndexChanged(1),
          ),
          _NavItem(
            icon: Icons.subway,
            isSelected: selectedIndex == 2,
            onTap: () => onIndexChanged(2),
          ),
          _NavItem(
            icon: Icons.person,
            isSelected: selectedIndex == 3,
            onTap: () => onIndexChanged(3),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110,
        height: 65,
        color: Colors.transparent,
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 28,
            shadows: [
              Shadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
