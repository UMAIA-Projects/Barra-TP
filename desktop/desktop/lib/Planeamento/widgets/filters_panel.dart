import 'package:flutter/material.dart';
import 'package:desktop/Planeamento/widgets/filter_checkbox.dart';
import 'package:desktop/constants/colors.dart';

class FiltersPanelWidget extends StatefulWidget {
  const FiltersPanelWidget({super.key});

  @override
  State<FiltersPanelWidget> createState() => FiltersPanelState();
}

class FiltersPanelState extends State<FiltersPanelWidget> {
  final Map<String, bool> transportFilters = {};
  final Map<String, bool> priceFilters = {};
  final Map<String, bool> stopFilters = {};

  final transportTypes = ['Autocarro', 'Comboio', 'Metro'];
  final priceRanges = ['0 € - 75 €', '75 € - 150 €', '150 € - 225 €', 'Personalizado'];
  final stopCounts = ['0', '0-5', '5-20', 'Personalizado'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      padding: const EdgeInsets.fromLTRB(40, 44, 40, 60),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Filtros',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: AppColors.barraTeal,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildDivider(),
          const SizedBox(height: 32),
          const Text(
            'Tipos de Transporte',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: AppColors.barraTeal,
            ),
          ),
          ...transportTypes.map((type) => FilterCheckboxWidget(
            label: type,
            checked: transportFilters[type] ?? false,
            onChanged: (val) => setState(() => transportFilters[type] = val),
          )),
          const SizedBox(height: 28),
          _buildDivider(),
          const SizedBox(height: 16),
          const Text(
            'Preço da viagem',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: AppColors.barraTeal,
            ),
          ),
          ...priceRanges.map((range) => FilterCheckboxWidget(
            label: range,
            checked: priceFilters[range] ?? false,
            onChanged: (val) => setState(() => priceFilters[range] = val),
          )),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 2,
      color: AppColors.barraTeal,
    );
  }
}