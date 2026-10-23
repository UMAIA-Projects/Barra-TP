import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../app/theme/app_theme.dart';
import '../app/providers/app_provider.dart';

class TripPlannerForm extends StatelessWidget {
  const TripPlannerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) => Column(
        children: [
          // Origin and Destination
          Row(
            children: [
              Expanded(
                child: _LocationField(
                  label: provider.origin,
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward, color: AppColors.primary, size: 26),
              const SizedBox(width: 8),
              Expanded(
                child: _LocationField(
                  label: provider.destination,
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Date and Time
          Row(
            children: [
              Expanded(
                child: _TimeField(
                  label: DateFormat('HH:mm\ndd/MM/yyyy').format(provider.departureTime),
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _TimeField(
                  label: DateFormat('HH:mm\ndd/MM/yyyy').format(provider.arrivalTime),
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Add Stops Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.light,
                foregroundColor: AppColors.primary,
                elevation: 4,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: const BorderSide(color: AppColors.primary, width: 1.4),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Adicionar Paragens',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Search Button
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                elevation: 4,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              onPressed: () => provider.searchRoutes(),
              icon: const Icon(Icons.search, size: 15),
              label: Text(
                'Pesquisa',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LocationField extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _LocationField({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.light,
          border: Border.all(color: AppColors.primary, width: 1.4),
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 4,
            ),
          ],
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}

class _TimeField extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _TimeField({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.light,
          border: Border.all(color: AppColors.primary, width: 1.4),
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 4,
            ),
          ],
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.primary,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
