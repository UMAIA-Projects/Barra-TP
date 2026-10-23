import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_colors.dart';
import '../providers/navigation_provider.dart';
import '../../common/linhas_navigation_helper.dart';

class TopNavTabs extends StatelessWidget {
  const TopNavTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navProvider, _) {
        final List<String> tabs = ['Favoritos', 'Todos', 'Autocarro', 'Comboio', 'Metro'];
        
        return Container(
          color: AppColors.primary,
          height: 48,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tabs.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return GestureDetector(
                  onTap: () {
                    LinhasNavigationHelper.navigateToTab(context, 'alertas');
                  },
                  child: Container(
                    width: 48,
                    alignment: Alignment.center,
                    child: const Icon(Icons.notifications, color: Colors.white),
                  ),
                );
              }
              final tabName = tabs[index - 1];
              final isActive = navProvider.activeTab == tabName.toLowerCase();
              return GestureDetector(
                onTap: () {
                  if (tabName.toLowerCase() == 'metro') {
                    navProvider.setActiveTab('metro');
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
                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
