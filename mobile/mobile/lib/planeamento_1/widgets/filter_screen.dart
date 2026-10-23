import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/planning_model.dart';
import '../theme/app_theme.dart';
import 'filter_panel.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FilterScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanningState>(
      builder: (context, planningState, child) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filtros',
                      style: AppTheme.textStyle(
                        color: AppTheme.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'NunitoSans',
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              // Filter content
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: FilterPanelContent(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FilterPanelContent extends StatelessWidget {
  const FilterPanelContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PlanningState>(
      builder: (context, planningState, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterSection(
              title: 'Tipos de Transporte',
              items: [
                ('Autocarro', TransportType.bus),
                ('Comboio', TransportType.train),
                ('Metro', TransportType.metro),
              ],
              isChecked: (item) =>
                  planningState.filters.transportTypes.contains(item),
              onChanged: (item) => planningState.toggleTransportType(item),
            ),
            Divider(
              color: AppTheme.borderColor,
              thickness: 3.5,
              height: 24,
            ),
            _buildPriceSection(planningState),
            _buildStopsSection(),
            _buildWalkingTimeSection(planningState),
            _buildChangesSection(),
          ],
        );
      },
    );
  }

  Widget _buildFilterSection<T>({
    required String title,
    required List<(String, T)> items,
    required bool Function(T) isChecked,
    required Function(T) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
        ),
        const SizedBox(height: 12),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked(item.$2),
                  onChanged: (value) => onChanged(item.$2),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Text(
                  item.$1,
                  style: AppTheme.textStyle(
                    color: AppTheme.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NunitoSans',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceSection(PlanningState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preço da viagem',
          style: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
        ),
        const SizedBox(height: 12),
        ...[
          ('0 € - 75 €', PriceRange.zero75),
          ('75 € - 150 €', PriceRange.range75150),
          ('150 € - 225 €', PriceRange.range150225),
          ('Personalizado', PriceRange.custom),
        ].map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Checkbox(
                  value: state.filters.priceRanges.contains(item.$2),
                  onChanged: (value) => state.togglePriceRange(item.$2),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Text(
                  item.$1,
                  style: AppTheme.textStyle(
                    color: AppTheme.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NunitoSans',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStopsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: AppTheme.borderColor,
          thickness: 3.5,
          height: 24,
        ),
        Text(
          'Número de Paragens',
          style: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
        ),
        const SizedBox(height: 12),
        ...['0', '0-5', '5-20', 'Personalizado'].map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (_) {},
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Text(
                  item,
                  style: AppTheme.textStyle(
                    color: AppTheme.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NunitoSans',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWalkingTimeSection(PlanningState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: AppTheme.borderColor,
          thickness: 3.5,
          height: 24,
        ),
        Text(
          'Tempo de Caminhada',
          style: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
        ),
        const SizedBox(height: 12),
        ...[
          ('0-15 min', WalkingTime.min0to15),
          ('15-30 min', WalkingTime.min15to30),
          ('30 min - 1h', WalkingTime.min30to60),
          ('Personalizado', WalkingTime.custom),
        ].map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Checkbox(
                  value: state.filters.walkingTimes.contains(item.$2),
                  onChanged: (value) => state.toggleWalkingTime(item.$2),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Text(
                  item.$1,
                  style: AppTheme.textStyle(
                    color: AppTheme.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NunitoSans',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChangesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: AppTheme.borderColor,
          thickness: 3.5,
          height: 24,
        ),
        Text(
          'Número de mudanças de transporte máximo',
          style: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
        ),
        const SizedBox(height: 12),
        ...['0', '0-5', '5-10', 'Personalizado'].map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (_) {},
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Text(
                  item,
                  style: AppTheme.textStyle(
                    color: AppTheme.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NunitoSans',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

