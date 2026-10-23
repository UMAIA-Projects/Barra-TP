import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme/app_theme.dart';
import '../app/providers/app_provider.dart';
import 'route_result_card.dart';

class ResultsSection extends StatelessWidget {
  const ResultsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) => Container(
        decoration: BoxDecoration(
          color: AppColors.light,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 4,
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Resultados',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                textBaseline: TextBaseline.alphabetic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Divider(
              color: AppColors.primary,
              thickness: 2,
            ),
            const SizedBox(height: 16),
            ...provider.routes.map(
              (route) => Column(
                children: [
                  RouteResultCard(route: route),
                  if (provider.routes.indexOf(route) < provider.routes.length - 1)
                    Divider(
                      color: AppColors.primary,
                      thickness: 1,
                      height: 16,
                    ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                elevation: 4,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              ),
              onPressed: () {},
              icon: const Icon(Icons.check, size: 14),
              label: Text(
                'Selecionar',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
