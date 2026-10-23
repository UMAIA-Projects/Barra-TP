import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app/theme/app_theme.dart';
import '../app/providers/app_provider.dart';

class FiltersPanel extends StatelessWidget {
  const FiltersPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) => Container(
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.85),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 4,
            ),
          ],
          border: Border.all(color: AppColors.border),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filtros',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontSize: 17,
                  ),
                ),
                GestureDetector(
                  onTap: () => provider.toggleFilters(),
                  child: Text(
                    'ocultar',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 9,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Divider(
              color: AppColors.primary,
              thickness: 1.5,
            ),
            const SizedBox(height: 12),
            // Transport Types
            Text(
              'Tipos de Transporte',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 9,
              ),
            ),
            const SizedBox(height: 8),
            ...provider.filters.transportTypes.entries.map((entry) {
              return _FilterCheckbox(
                label: entry.key,
                value: entry.value,
                onChanged: (value) => provider.updateFilter(
                  'transport',
                  entry.key,
                  value ?? false,
                ),
              );
            }),
            const SizedBox(height: 12),
            Divider(
              color: AppColors.primary,
              thickness: 1.5,
            ),
            const SizedBox(height: 12),
            // Price Range
            Text(
              'Preço da viagem',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 9,
              ),
            ),
            const SizedBox(height: 8),
            ...provider.filters.priceRanges.entries.map((entry) {
              return _FilterCheckbox(
                label: entry.key,
                value: entry.value,
                onChanged: (value) => provider.updateFilter(
                  'price',
                  entry.key,
                  value ?? false,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _FilterCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _FilterCheckbox({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            fillColor: MaterialStateProperty.all(AppColors.light),
            checkColor: AppColors.primary,
            side: const BorderSide(color: AppColors.primary, width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 6,
          ),
        ),
      ],
    );
  }
}
