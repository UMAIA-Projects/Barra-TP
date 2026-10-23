import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.tealDark,
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top padding area
          const SizedBox(height: 20),
          // Header content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Hamburger Menu
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: AppTheme.white,
                    size: 28,
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 16),
                // Logo/Title
                Expanded(
                  child: Text(
                    'BARRA TP',
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                ),
                // Location Icon
                IconButton(
                  icon: const Icon(
                    Icons.location_on,
                    color: AppTheme.white,
                    size: 32,
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
