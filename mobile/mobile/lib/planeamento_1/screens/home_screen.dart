import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/planning_model.dart';
import '../theme/app_theme.dart';
import '../widgets/app_bottom_nav.dart';
import '../../common/navigation_bar.dart';
import 'planning_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const PlanningScreen(),
    _buildPlaceholderScreen('Location'),
    _buildPlaceholderScreen('Routes'),
    _buildPlaceholderScreen('Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanningState>(
      builder: (context, planningState, child) {
        return Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: SafeArea(
            top: false,
            child: CustomBottomBar(
              currentIndex: _currentIndex,
              onTabSelectedOverride: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

Widget _buildPlaceholderScreen(String title) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'BARRA TP',
        style: AppTheme.textStyle(
          color: Colors.white,
          fontSize: 45,
          fontWeight: FontWeight.w400,
          fontFamily: 'DaysOne',
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.location_on),
          iconSize: 40,
          onPressed: () {},
        ),
      ],
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$title',
            style: AppTheme.textStyle(
              color: AppTheme.textColor,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Esta página está em desenvolvimento',
            style: AppTheme.textStyle(
              color: AppTheme.textColor.withValues(alpha: 0.7),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}
