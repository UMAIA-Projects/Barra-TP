import 'package:flutter/material.dart';
import '../config/theme.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103,
      color: AppColors.brandTeal,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Menu Icon
          IconButton(
            onPressed: () {},
            icon: const MenuIcon(),
            iconSize: 32,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          // Logo Text
          Text(
            'BARRA TP',
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 40,
              letterSpacing: 0.5,
            ),
          ),
          // Location Icon
          IconButton(
            onPressed: () {},
            icon: const LocationIcon(),
            iconSize: 42,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

// Custom Menu Icon
class MenuIcon extends StatelessWidget {
  const MenuIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 3,
          color: AppColors.brandGray,
        ),
        const SizedBox(height: 6),
        Container(
          width: 24,
          height: 3,
          color: AppColors.brandGray,
        ),
        const SizedBox(height: 6),
        Container(
          width: 24,
          height: 3,
          color: AppColors.brandGray,
        ),
      ],
    );
  }
}

// Custom Location Icon
class LocationIcon extends StatelessWidget {
  const LocationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.location_on,
      color: AppColors.white,
      size: 42,
      shadows: [
        Shadow(
          color: Colors.black.withValues(alpha: 0.25),
          offset: const Offset(0, 2),
          blurRadius: 2,
        ),
      ],
    );
  }
}
