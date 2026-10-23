import 'package:flutter/material.dart';

class TabSelector extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChange;

  const TabSelector({
    Key? key,
    required this.activeTab,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF475569)),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Tab Nacional
          GestureDetector(
            onTap: () => onTabChange('nacional'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
              decoration: BoxDecoration(
                color: activeTab == 'nacional'
                    ? const Color(0xFF475569)
                    : Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Nacional',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: activeTab == 'nacional'
                      ? const Color(0xFFD1D5DB)
                      : const Color(0xFF475569),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Tab Internacional - AGORA COM MESMO ESTILO
          GestureDetector(
            onTap: () => onTabChange('internacional'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6), // Padding aumentado
              decoration: BoxDecoration(
                color: activeTab == 'internacional'
                    ? const Color(0xFF475569) // MESMA COR quando ativo
                    : Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Internacional',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: activeTab == 'internacional'
                      ? const Color(0xFFD1D5DB) // MESMA COR do texto quando ativo
                      : const Color(0xFF475569),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}