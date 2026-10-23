import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme/app_theme.dart';
import '../app/providers/app_provider.dart';

class TabSelector extends StatelessWidget {
  const TabSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Consumer<AppProvider>(
            builder: (context, provider, _) => Expanded(
              child: GestureDetector(
                onTap: () => provider.setCurrentTab(0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: provider.currentTabIndex == 0
                        ? AppColors.primary
                        : AppColors.primary.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Text(
                    'Planeamento',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Consumer<AppProvider>(
            builder: (context, provider, _) => Expanded(
              child: GestureDetector(
                onTap: () => provider.setCurrentTab(1),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: provider.currentTabIndex == 1
                        ? AppColors.primary
                        : AppColors.primary.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.25),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Text(
                    'Planeamentos Guardados',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
