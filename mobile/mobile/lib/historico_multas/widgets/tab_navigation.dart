import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TabNavigationWidget extends StatelessWidget {
  final String activeTab;
  final Function(String) onTabChange;

  const TabNavigationWidget({
    Key? key,
    required this.activeTab,
    required this.onTabChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabButton(
            label: 'Viagens',
            isActive: activeTab == 'viagens',
            onPressed: () => onTabChange('viagens'),
          ),
          const SizedBox(width: 76),
          _buildTabButton(
            label: 'Multas',
            isActive: activeTab == 'multas',
            onPressed: () => onTabChange('multas'),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required String label,
    required bool isActive,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.brandTeal,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            color: Color.fromARGB(64, 0, 0, 0),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(isActive ? 1.0 : 0.5),
                fontSize: 15,
                fontWeight: FontWeight.w800,
                fontFamily: 'NunitoSans',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
