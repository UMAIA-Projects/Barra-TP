import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'navigation_helper.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTabSelectedOverride;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    this.onTabSelectedOverride,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    void handleTap(int index) {
      // se quiseres poder sobrepor o comportamento (ex.: IndexedStack)
      if (onTabSelectedOverride != null) {
        onTabSelectedOverride!(index);
        return;
      }

      if (index == currentIndex) return; // já estás nessa rota

      NavigationHelper.navigateToPage(context, index);
    }

    return SafeArea(
      top: false,
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          //color: colorScheme.surface,
          color: const Color(0xFF365F67)
          /*
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
          */
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavItem(
              index: 0,
              currentIndex: currentIndex,
              asset: 'assets/icons/home.svg',
              label: 'Home',
              onTap: handleTap,
            ),
            _NavItem(
              index: 1,
              currentIndex: currentIndex,
              asset: 'assets/icons/loc.svg',
              label: 'Mapa',
              onTap: handleTap,
            ),
            _NavItem(
              index: 2,
              currentIndex: currentIndex,
              asset: 'assets/icons/lines.svg',
              label: 'Linhas',
              onTap: handleTap,
            ),
            _NavItem(
              index: 3,
              currentIndex: currentIndex,
              asset: 'assets/icons/profile.svg',
              label: 'Perfil',
              onTap: handleTap,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String asset;
  final String label;
  final ValueChanged<int> onTap;

  const _NavItem({
    required this.index,
    required this.currentIndex,
    required this.asset,
    required this.label,
    required this.onTap,
  });

  bool get _isSelected => index == currentIndex;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final Color iconColor = _isSelected
        ? Colors.redAccent //colorScheme.primary
        : Colors.white; //colorScheme.onSurface;

    final TextStyle labelStyle =
        Theme.of(context).textTheme.labelMedium!.copyWith(
              color: _isSelected
                  ? Colors.redAccent //colorScheme.primary
                  : Colors.white, //colorScheme.onSurface,
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
              ),
              const SizedBox(height: 4),
              Text(label, style: labelStyle),
            ],
          ),
        ),
      ),
    );
  }
}
