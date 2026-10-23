import 'package:flutter/material.dart';
import 'package:mobile/common/header_app.dart';
import '../../common/navigation_bar.dart';
import '../nav/app_drawer.dart';
import 'flutter_models_alert.dart';
import 'flutter_widgets_alert_tile.dart';
import 'flutter_constants_colors.dart';
import '../../common/linhas_navigation_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeTab = 'favoritos';
  String searchQuery = '';
  int bottomNavIndex = 2;

  final List<String> tabs = ['Favoritos', 'Todos', 'Autocarro', 'Comboio', 'Metro'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  drawer: const AppDrawer(), // se quiseres drawer
  backgroundColor: Colors.white,

  body: Column(
    children: [
      const HeaderApp(), // ✅ HEADER COMMON

      // SEARCH
      Container(
        color: AppColors.lightGray,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          onChanged: (value) => setState(() => searchQuery = value),
          decoration: const InputDecoration(
            hintText: 'Pesquisar linha...',
            border: InputBorder.none,
            suffixIcon: Icon(Icons.search),
          ),
        ),
      ),

      // TABS
      Container(
        color: AppColors.tealdark,
        height: 48,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tabs.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                width: 48,
                alignment: Alignment.center,
                child: const Icon(Icons.notifications, color: Colors.white),
              );
            }

            final tabName = tabs[index - 1];
            final isActive = activeTab == tabName.toLowerCase();

            return GestureDetector(
              onTap: () {
                if (tabName.toLowerCase() == 'favoritos') {
                  setState(() => activeTab = 'favoritos');
                } else {
                  LinhasNavigationHelper.navigateToTab(context, tabName.toLowerCase());
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: Text(
                    tabName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                          isActive ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),

      // ALERTAS → ocupa o resto do ecrã
      Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemCount: mockAlerts.length,
          itemBuilder: (context, index) {
            return AlertTile(
              alert: mockAlerts[index],
              isLast: index == mockAlerts.length - 1,
            );
          },
        ),
      ),
    ],
  ),

  bottomNavigationBar: const CustomBottomBar(currentIndex: 2),
);
  }
}