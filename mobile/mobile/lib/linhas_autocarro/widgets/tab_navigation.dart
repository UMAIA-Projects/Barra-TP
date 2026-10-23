import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TabNavigation extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChanged;

  const TabNavigation({
    Key? key,
    required this.activeTab,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {'id': 'favoritos', 'label': 'Favoritos', 'icon': Icons.home},
      {'id': 'todos', 'label': 'Todos'},
      {'id': 'autocarro', 'label': 'Autocarro'},
      {'id': 'comboio', 'label': 'Comboio'},
      {'id': 'metro', 'label': 'Metro'},
    ];

    return Container(
      color: AppColors.transportTeal,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 35,
            color: AppColors.transportTeal,
            child: Icon(
              Icons.notifications,
              color: AppColors.white,
              size: 24,
            ),
          ),
          Expanded(
            child: Row(
              children: List.generate(tabs.length, (index) {
                final tab = tabs[index];
                final tabId = tab['id'] as String;
                final label = tab['label'] as String;
                final isActive = activeTab == tabId;

                return Expanded(
                  child: GestureDetector(
                    onTap: () => onTabChanged(tabId),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isActive ? AppColors.tabSelectedBg : AppColors.transportTeal,
                        border: Border(
                          right: BorderSide(
                            color: AppColors.transportTeal,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            label,
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
