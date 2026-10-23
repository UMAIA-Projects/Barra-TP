import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../providers/app_state.dart';
import '../widgets/route_list.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';
import '../../common/linhas_navigation_helper.dart';
import '../../alertas/flutter_constants_colors.dart' as AlertColors;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';
  final List<String> tabs = ['Favoritos', 'Todos', 'Autocarro', 'Comboio', 'Metro'];

  void _navigateToTab(String tab) {
    LinhasNavigationHelper.navigateToTab(context, tab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      body: Column(
        children: [
          const HeaderApp(),
          // Search Bar (alertas style)
          Container(
            color: AlertColors.AppColors.lightGray,
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
          // Tabs Bar (alertas style)
          Container(
            color: AlertColors.AppColors.tealdark,
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabs.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () => _navigateToTab('alertas'),
                    child: Container(
                      width: 48,
                      alignment: Alignment.center,
                      child: const Icon(Icons.notifications, color: Colors.white),
                    ),
                  );
                }
                final tabName = tabs[index - 1];
                final isActive = tabName.toLowerCase() == 'autocarro';
                return GestureDetector(
                  onTap: () => _navigateToTab(tabName.toLowerCase()),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Center(
                      child: Text(
                        tabName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Content
          Expanded(
            child: Consumer<AppState>(
              builder: (context, appState, _) {
                return RouteList(
                  searchQuery: searchQuery,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 0),
    );
  }
}
