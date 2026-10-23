import 'package:flutter/material.dart';
import '../app/theme/app_theme.dart';
import '../../common/header_app.dart';
import '../widgets/tab_selector.dart';
import '../../common/navigation_bar.dart';

class SavedJourneysScreen extends StatelessWidget {
  const SavedJourneysScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              // Header with protection bar
              Container(
                color: AppColors.primary,
                height: 53,
              ),
              const HeaderApp(),
              const SizedBox(height: 0),
              const TabSelector(),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark_outline,
                        size: 64,
                        color: AppColors.primary.withValues(alpha: 0.3),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No saved journeys yet',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Plan a journey and save it for later',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.primary.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: const CustomBottomBar(currentIndex: 1),
          ),
        ],
      ),
    );
  }
}
