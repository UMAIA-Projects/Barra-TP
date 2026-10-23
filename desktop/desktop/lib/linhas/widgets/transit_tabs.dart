import 'package:flutter/material.dart';
import 'package:desktop/linhas/screens/linhas_favoritas_screen.dart';
import 'package:desktop/linhas/screens/linhas_todos_screen.dart';
import 'package:desktop/linhas/screens/linhas_autocarros_screen.dart';
import 'package:desktop/linhas/screens/linhas_comboios_screen.dart';
import 'package:desktop/linhas/screens/linhas_metros_screen.dart';

class TabWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isFirst;
  final bool isLast;
  final VoidCallback onTap;

  const TabWidget({
    super.key,
    required this.label,
    required this.isSelected,
    this.isFirst = false,
    this.isLast = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFF475569),
          border: Border(
            top: BorderSide(
              color: isSelected ? const Color(0xFF475569) : Colors.white,
              width: 2,
            ),
            bottom: BorderSide(
              color: isSelected ? const Color(0xFF475569) : Colors.white,
              width: 2,
            ),
            left: isFirst ? BorderSide(
              color: isSelected ? const Color(0xFF475569) : Colors.white,
              width: 2,
            ) : BorderSide.none,
            right: isLast ? BorderSide(
              color: isSelected ? const Color(0xFF475569) : Colors.white,
              width: 2,
            ) : BorderSide.none,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: isSelected ? const Color(0xFF475569) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class TransitTabs extends StatefulWidget {
  final String? selectedTab;

  const TransitTabs({super.key, this.selectedTab});

  @override
  State<TransitTabs> createState() => _TransitTabsState();
}

class _TransitTabsState extends State<TransitTabs> {
  late String _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.selectedTab ?? 'Favoritos';
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      'Favoritos',
      'Todos',
      'Autocarros',
      'Comboios',
      'Metros',
    ];

    return Container(
      height: 80,
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tabLabel = entry.value;
          final isSelected = _selectedTab == tabLabel;
          final isFirst = index == 0;
          final isLast = index == tabs.length - 1;
          
          return Expanded(
            child: TabWidget(
              label: tabLabel,
              isSelected: isSelected,
              isFirst: isFirst,
              isLast: isLast,
              onTap: () {
                _handleTabTap(context, tabLabel);
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  void _handleTabTap(BuildContext context, String tabLabel) {
    setState(() {
      _selectedTab = tabLabel;
    });

    switch (tabLabel) {
      case 'Favoritos':
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LinhasFavoritasScreen()),
        );
        break;
      case 'Todos':
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LinhasTodosScreen()),
        );
        break;
      case 'Autocarros':
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LinhasAutocarrosScreen()),
        );
        break;
      case 'Comboios':
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LinhasComboiosScreen()),
        );
        break;
      case 'Metros':
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LinhasMetrosScreen()),
        );
        break;
    }
  }
}
