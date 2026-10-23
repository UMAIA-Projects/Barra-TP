import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'location_screen.dart';
import 'routes_screen.dart';
import 'profile_screen.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    LocationScreen(),
    RoutesScreen(),
    ProfileScreen(),
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _screens[_selectedIndex];
  }
}
