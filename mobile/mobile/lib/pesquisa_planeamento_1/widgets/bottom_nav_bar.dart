import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../../common/navigation_helper.dart';

class BarraTPBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onItemTapped;

  const BarraTPBottomNavBar({
    Key? key,
    required this.selectedIndex,
    this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        height: 64,
        decoration: const BoxDecoration(
          color: AppColors.tealDark,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavBarItem(
              index: 0,
              currentIndex: selectedIndex,
              asset: 'assets/icons/home.svg',
              label: 'Home',
              onTap: (index) {
                onItemTapped?.call(index);
                NavigationHelper.navigateToPage(context, index);
              },
            ),
            _NavBarItem(
              index: 1,
              currentIndex: selectedIndex,
              asset: 'assets/icons/loc.svg',
              label: 'Mapa',
              onTap: (index) {
                onItemTapped?.call(index);
                NavigationHelper.navigateToPage(context, index);
              },
            ),
            _NavBarItem(
              index: 2,
              currentIndex: selectedIndex,
              asset: 'assets/icons/lines.svg',
              label: 'Linhas',
              onTap: (index) {
                onItemTapped?.call(index);
                NavigationHelper.navigateToPage(context, index);
              },
            ),
            _NavBarItem(
              index: 3,
              currentIndex: selectedIndex,
              asset: 'assets/icons/profile.svg',
              label: 'Perfil',
              onTap: (index) {
                onItemTapped?.call(index);
                NavigationHelper.navigateToPage(context, index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String asset;
  final String label;
  final ValueChanged<int> onTap;

  const _NavBarItem({
    required this.index,
    required this.currentIndex,
    required this.asset,
    required this.label,
    required this.onTap,
  });

  bool get _isSelected => index == currentIndex;

  @override
  Widget build(BuildContext context) {
    final Color iconColor = _isSelected ? Colors.white : Colors.white70;

    final TextStyle labelStyle = TextStyle(
      color: _isSelected ? Colors.white : Colors.white70,
      fontSize: 10,
      fontWeight: _isSelected ? FontWeight.w700 : FontWeight.w400,
    );

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: () => onTap(index),
        child: Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                asset,
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                placeholderBuilder: (context) => _buildFallbackIcon(context),
              ),
              const SizedBox(height: 4),
              Text(label, style: labelStyle),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackIcon(BuildContext context) {
    final Color iconColor = _isSelected ? Colors.white : Colors.white70;

    IconData iconData;
    switch (index) {
      case 0:
        iconData = Icons.home;
        break;
      case 1:
        iconData = Icons.location_on;
        break;
      case 2:
        iconData = Icons.train;
        break;
      case 3:
        iconData = Icons.person;
        break;
      default:
        iconData = Icons.error;
    }

    return Icon(iconData, size: 24, color: iconColor);
  }
}