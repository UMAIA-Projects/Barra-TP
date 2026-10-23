import 'package:flutter/material.dart';
import 'flutter_constants_colors.dart';
import '../../common/navigation_helper.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBottomBar({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.tealdark,
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: Icons.home,
            isSelected: currentIndex == 0,
            onTap: () {
              onTap?.call(0);
              NavigationHelper.navigateToPage(context, 0);
            },
          ),
          _NavItem(
            icon: Icons.location_on,
            isSelected: currentIndex == 1,
            onTap: () {
              onTap?.call(1);
              NavigationHelper.navigateToPage(context, 1);
            },
          ),
          _NavItem(
            icon: Icons.alt_route,
            isSelected: currentIndex == 2,
            onTap: () {
              onTap?.call(2);
              NavigationHelper.navigateToPage(context, 2);
            },
          ),
          _NavItem(
            icon: Icons.person,
            isSelected: currentIndex == 3,
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

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.white,
            size: isSelected ? 28 : 24,
          ),
        ],
      ),
    );
  }
}
