import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/planning_model.dart';
import '../theme/app_theme.dart';

class FilterPanel extends StatefulWidget {
  final Function() onClose;

  const FilterPanel({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlanningState>(
      builder: (context, planningState, child) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 165),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.85),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            border: Border.all(
              color: AppTheme.borderColor.withValues(alpha: 0.2),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Filtros',
                        style: AppTheme.textStyle(
                          color: AppTheme.textColor,
                          fontSize: 16.5,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onClose,
                        child: Text(
                          'ocultar',
                          style: AppTheme.textStyle(
                            color: AppTheme.textColor,
                            fontSize: 9,
                            fontWeight: FontWeight.w200,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppTheme.borderColor,
                    thickness: 3.5,
                    height: 16,
                  ),
                  _buildFilterSection(
                    title: 'Tipos de Transporte',
                    items: [
                      ('Autocarro', TransportType.bus),
                      ('Comboio', TransportType.train),
                      ('Metro', TransportType.metro),
                    ],
                    isChecked: (item) =>
                        planningState.filters.transportTypes
                            .contains(item),
                    onChanged: (item) =>
                        planningState.toggleTransportType(item),
                  ),
                  Divider(
                    color: AppTheme.borderColor,
                    thickness: 3.5,
                    height: 16,
                  ),
                  _buildPriceSectionSection(planningState),
                  _buildStopsSection(),
                  _buildWalkingTimeSection(planningState),
                  _buildChangesSection(),
                ],
              ),
            ),
          ),
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
            fontSize: 9.2,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
        ),
        const SizedBox(height: 6),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
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
                    fontSize: 6.4,
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

  Widget _buildPriceSectionSection(PlanningState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Preço da viagem',
          style: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 9,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
        ),
        const SizedBox(height: 6),
        ...[
          ('0 € - 75 €', PriceRange.zero75),
          ('75 € - 150 €', PriceRange.range75150),
          ('150 € - 225 €', PriceRange.range150225),
          ('Personalizado', PriceRange.custom),
        ].map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
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
                    fontSize: 6.3,
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
          height: 16,
        ),
        Text(
          'Número de Paragens',
          style: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 8,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
        ),
        const SizedBox(height: 6),
        ...['0', '0-5', '5-20', 'Personalizado'].map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
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
                    fontSize: 5.5,
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
          height: 16,
        ),
        Text(
          'Tempo de Caminhada',
          style: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 8,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
        ),
        const SizedBox(height: 6),
        ...[
          ('0-15 min', WalkingTime.min0to15),
          ('15-30 min', WalkingTime.min15to30),
          ('30 min - 1h', WalkingTime.min30to60),
          ('Personalizado', WalkingTime.custom),
        ].map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
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
                    fontSize: 5.5,
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
          height: 16,
        ),
        Text(
          'Número de mudanças de transporte máximo',
          style: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 7.95,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
        ),
        const SizedBox(height: 6),
        ...['0', '0-5', '5-10', 'Personalizado'].map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
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
                    fontSize: 5.5,
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
