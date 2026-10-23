import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.brandPrimary,
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home,
            index: 0,
            label: 'Home',
          ),
          _buildNavItem(
            icon: Icons.location_on,
            index: 1,
            label: 'Location',
          ),
          _buildNavItem(
            icon: Icons.cable,
            index: 2,
            label: 'Routes',
          ),
          _buildNavItem(
            icon: Icons.person,
            index: 3,
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required int index,
    required String label,
  }) {
    final isSelected = widget.selectedIndex == index;
    return GestureDetector(
      onTap: () => widget.onTabChanged(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 32,
          ),
        ],
      ),
    );
  }
}
