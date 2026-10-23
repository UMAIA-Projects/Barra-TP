import 'package:flutter/material.dart';
import '../config/theme.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      color: AppColors.brandTeal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home,
            isSelected: selectedIndex == 0,
            onTap: () => onItemTapped(0),
          ),
          _NavItem(
            icon: Icons.location_on,
            isSelected: selectedIndex == 1,
            onTap: () => onItemTapped(1),
            showShadow: true,
          ),
          _NavItem(
            icon: Icons.route,
            isSelected: selectedIndex == 2,
            onTap: () => onItemTapped(2),
          ),
          _NavItem(
            icon: Icons.person,
            isSelected: selectedIndex == 3,
            onTap: () => onItemTapped(3),
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
  final bool showShadow;

  const _NavItem({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.showShadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.brandTeal,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 110,
          height: 63,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.brandTealLight : AppColors.brandTeal,
            boxShadow: showShadow
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Icon(
            icon,
            color: AppColors.white,
            size: 32,
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.25),
                offset: const Offset(0, 2),
                blurRadius: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
