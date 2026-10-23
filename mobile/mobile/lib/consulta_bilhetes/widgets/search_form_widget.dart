import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/trip_model.dart';

class SearchFormWidget extends StatefulWidget {
  final ValueChanged<SearchCriteria>? onSearch;

  const SearchFormWidget({Key? key, this.onSearch}) : super(key: key);

  @override
  State<SearchFormWidget> createState() => _SearchFormWidgetState();
}

class _SearchFormWidgetState extends State<SearchFormWidget> {
  // Nacional selecionado por default
  bool isNational = true; 
  
  // Valores default para evitar erro de null
  String origin = 'Origem';
  String destination = 'Destino';
  DateTime departureDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Column(
        children: [
          // Tab Selector
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF475569)),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTab(true, 'Nacional'),
                _buildTab(false, 'Internacional'),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          // Mantendo a estrutura de quadrados (inputs)
          Row(
            children: [
              Expanded(child: _buildInput('De', 'Origem')),
              const SizedBox(width: 12),
              Expanded(child: _buildInput('Para', 'Destino')),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildInput('Data', 'De: dd/MM/yyyy -> Até: dd/MM/yyyy')),
              const SizedBox(width: 12),
              _buildSearchButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(bool national, String label) {
    bool isActive = isNational == national;
    return GestureDetector(
      onTap: () => setState(() => isNational = national),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF475569) : Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: isActive ? Colors.white : const Color(0xFF475569),
          ),
        ),
      ),
    );
  }

  Widget _buildInput(String label, String value, [String? s]) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF475569)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 3, offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 10, color: Color(0xFF475569))),
          Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSearchButton() {
    return GestureDetector(
      onTap: () {
        widget.onSearch?.call(SearchCriteria(
          origin: origin,
          destination: destination,
          departureDate: departureDate,
          isNational: isNational,
        ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: const Color(0xFF475569),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text('Pesquisa', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}