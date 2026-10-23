import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BottomNavWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomNavWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppTheme.brandTeal,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onItemSelected,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: selectedIndex == 0 ? Colors.white : Colors.white.withValues(alpha: 0.7)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on, color: selectedIndex == 1 ? Colors.white : Colors.white.withValues(alpha: 0.7)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.route, color: selectedIndex == 2 ? Colors.white : Colors.white.withValues(alpha: 0.7)),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: selectedIndex == 3 ? Colors.white : Colors.white.withValues(alpha: 0.7)),
          label: '',
        ),
      ],
    );
  }
}
