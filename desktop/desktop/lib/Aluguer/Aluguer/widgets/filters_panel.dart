import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';

class FilterPanel extends StatefulWidget {
  const FilterPanel({Key? key}) : super(key: key);

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  final Map<String, bool> categoryFilters = {
    'Carro Pequeno': false,
    'Carro Médio': false,
    'Carro Grande': false,
    'Carro Premium': false,
    'SUV': false,
  };

  final Map<String, bool> transmissionFilters = {
    'Automática': false,
    'Manual': false,
  };

  final Map<String, bool> priceFilters = {
    '0 € - 75 €': false,
    '75 € - 150 €': false,
    '150 € - 225 €': false,
    '225 € +': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filtros',
                style: TextStyle(
                  color: AppColors.barraTeal,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NunitoSans',
                ),
              ),
              const SizedBox(height: 8),
              Divider(
                color: AppColors.barraTeal,
                thickness: 2,
                height: 16,
              ),
              const SizedBox(height: 16),
              // Category filters
              _FilterSection(
                title: 'Categoria de carro',
                filters: categoryFilters,
                onChanged: (key, value) {
                  setState(() => categoryFilters[key] = value);
                },
              ),
              const SizedBox(height: 16),
              Divider(
                color: AppColors.barraTeal,
                thickness: 2,
                height: 16,
              ),
              const SizedBox(height: 16),
              // Transmission filters
              _FilterSection(
                title: 'Caixa',
                filters: transmissionFilters,
                onChanged: (key, value) {
                  setState(() => transmissionFilters[key] = value);
                },
              ),
              const SizedBox(height: 16),
              Divider(
                color: AppColors.barraTeal,
                thickness: 2,
                height: 16,
              ),
              const SizedBox(height: 16),
              // Price filters
              _FilterSection(
                title: 'Preço por dia',
                filters: priceFilters,
                onChanged: (key, value) {
                  setState(() => priceFilters[key] = value);
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Material(
                  color: AppColors.barraTeal,
                  borderRadius: BorderRadius.circular(8),
                  elevation: 4,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        categoryFilters.updateAll((key, value) => false);
                        transmissionFilters.updateAll((key, value) => false);
                        priceFilters.updateAll((key, value) => false);
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Text(
                        'Remover',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterSection extends StatelessWidget {
  final String title;
  final Map<String, bool> filters;
  final Function(String, bool) onChanged;

  const _FilterSection({
    Key? key,
    required this.title,
    required this.filters,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.barraTeal,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'NunitoSans',
          ),
        ),
        const SizedBox(height: 8),
        ...filters.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: Checkbox(
                    value: entry.value,
                    onChanged: (value) => onChanged(entry.key, value ?? false),
                    activeColor: AppColors.barraTeal,
                    side: BorderSide(
                      color: AppColors.barraTeal,
                      width: 2,
                    ),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    entry.key,
                    style: TextStyle(
                      color: AppColors.barraTeal,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'NunitoSans',
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}