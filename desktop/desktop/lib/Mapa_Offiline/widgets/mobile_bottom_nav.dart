import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/Mapa_Offiline/models/nav_item.dart';

class MobileBottomNav extends StatelessWidget {
  final List<NavItem> navItems;
  final String selectedNav;
  final Function(String) onNavItemSelected;

  const MobileBottomNav({
    Key? key,
    required this.navItems,
    required this.selectedNav,
    required this.onNavItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.grey300,
            width: 1,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: navItems.take(5).map((item) {
          final isSelected = selectedNav == item.id;
          return Material(
            color: AppColors.transparent,
            child: InkWell(
              onTap: () => onNavItemSelected(item.id),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      item.icon,
                      color: isSelected ? AppColors.barraTeal : AppColors.grey400,
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label.split(' ')[0],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? AppColors.barraTeal : AppColors.grey400,
                        fontFamily: 'NunitoSans',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
