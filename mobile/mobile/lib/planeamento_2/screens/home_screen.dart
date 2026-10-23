import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme/app_theme.dart';
import '../app/providers/app_provider.dart';
import '../../common/header_app.dart';
import '../widgets/trip_planner_form.dart';
import '../widgets/filters_panel.dart';
import '../widgets/results_section.dart';
import '../widgets/map_preview.dart';
import '../../common/navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Column(
            children: [
              const HeaderApp(),
              // Search Bar (igual ao planeamento_1)
              Container(
                color: AppColors.secondary,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 16,
                    ),
                    const Icon(Icons.search, color: Colors.white),
                    const SizedBox(width: 8),
                    Text(
                      'Pesquisa',
                      style: AppTheme.textStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NunitoSans',
                      ),
                    ),
                  ],
                ),
              ),
              // Tabs (igual ao planeamento_1)
              Container(
                color: AppColors.secondary,
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: Row(
                  children: [
                    Consumer<AppProvider>(
                      builder: (context, provider, _) => GestureDetector(
                        onTap: () => provider.setCurrentTab(0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: provider.currentTabIndex == 0 ? AppColors.primary : AppColors.primary.withValues(alpha: 0.8),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.25),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            'Planeamento',
                            style: AppTheme.textStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'DaysOne',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Consumer<AppProvider>(
                      builder: (context, provider, _) => GestureDetector(
                        onTap: () => provider.setCurrentTab(1),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: provider.currentTabIndex == 1 ? AppColors.primary : AppColors.primary.withValues(alpha: 0.8),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.25),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            'Planeamentos Guardados',
                            style: AppTheme.textStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'DaysOne',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: TripPlannerForm(),
                      ),
                      Consumer<AppProvider>(
                        builder: (context, provider, _) {
                          if (provider.showFilters) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              child: const FiltersPanel(),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: AppColors.primary,
                          thickness: 1.5,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: ResultsSection(),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: MapPreview(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          color: AppColors.primary,
                          thickness: 1.5,
                        ),
                      ),
                      const SizedBox(height: 80),
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
