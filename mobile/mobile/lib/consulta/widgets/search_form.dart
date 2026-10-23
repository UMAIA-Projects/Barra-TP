import 'package:flutter/material.dart';
import 'tab_selector.dart';
import 'search_button.dart';
import '../../consulta_bilhetes/screens/home_screen.dart' as consulta_bilhetes;

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  String activeTab = 'nacional';

  void handleSearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const consulta_bilhetes.HomeScreen(),
      ),
    );
  }

  Widget _buildInputField(String label, {double? width}) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF475569)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Color(0xFF475569),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataField(String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF475569)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Color(0xFF475569),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPassageirosField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF475569)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Passageiros',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF475569),
            ),
          ),
          SizedBox(height: 4),
          Text(
            '1x Adulto (30 a 60)',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF475569),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 480),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          TabSelector(
            activeTab: activeTab,
            onTabChange: (tab) => setState(() => activeTab = tab),
          ),
          const SizedBox(height: 20),
          // Linha 1: Origem e Destino
          Row(
            children: [
              Expanded(
                child: _buildInputField('Selecione Origem'),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildInputField('Selecione Destino'),
              ),
            ],
          ),
          const SizedBox(height: 9), // REDUZIDO de 12 para 9 (subiu 3 pixels)
          // Linha 2: Data Atual e Passageiros
          Row(
            children: [
              Expanded(
                child: _buildDataField('Data Atual'),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildPassageirosField(),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Linha 3: Data Regresso
          Row(
            children: [
              Container(
                width: 180,
                child: _buildDataField('Data Regresso'),
              ),
              const SizedBox(width: 50),
              Container(
                width: 100,
                child: Center(
                  child: SearchButton(onPressed: () => handleSearch(context)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}