import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../../common/navigation_helper.dart';

class BarraTPBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const BarraTPBottomNavBar({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BarraTPColors.teal,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 4,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarItem(
            icon: Icons.home,
            isActive: currentIndex == 0,
            onTap: () {
              onTap?.call(0);
              NavigationHelper.navigateToPage(context, 0);
            },
          ),
          _NavBarItem(
            icon: Icons.location_on,
            isActive: currentIndex == 1,
            onTap: () {
              onTap?.call(1);
              NavigationHelper.navigateToPage(context, 1);
            },
          ),
          _NavBarItem(
            icon: Icons.route,
            isActive: currentIndex == 2,
            onTap: () {
              onTap?.call(2);
              NavigationHelper.navigateToPage(context, 2);
            },
          ),
          _NavBarItem(
            icon: Icons.person,
            isActive: currentIndex == 3,
            onTap: () {
              onTap?.call(3);
              NavigationHelper.navigateToPage(context, 3);
            },
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: BarraTPColors.teal,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Icon(
          icon,
          color: Colors.white,
          size: 28,
          shadows: [
            Shadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
    );
  }
}
