import 'package:flutter/material.dart';

class FilterBarWidget extends StatelessWidget {
  const FilterBarWidget({super.key});

  static const List<String> filters = [
    "Transportes",
    "Orçamentos",
    "Paragens",
    "Empresas",
    "Distância",
    "Duração",
    "Descontos"
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: filters.asMap().entries.map((entry) {
        final isLast = entry.key == filters.length - 1;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 24),
            child: _buildFilterButton(entry.value),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFilterButton(String filter) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth, // Usa toda a largura disponível
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF475569), width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  filter,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF475569),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 8),
              Image.network(
                "https://api.builder.io/api/v1/image/assets/TEMP/b176bc423c5ebe116e7e2ef565b9be5b046b9b6e?placeholderIfAbsent=true&apiKey=8d7cc46f0fec419ea078309afe54e911",
                width: 13,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.filter_list, size: 13, color: Color(0xFF475569));
                },
                height: 6,
              ),
            ],
          ),
        );
      },
    );
  }
}
