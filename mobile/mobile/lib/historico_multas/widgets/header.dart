import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top protection bar
        Container(
          height: 62,
          color: AppTheme.brandTeal,
        ),
        // Main header
        Container(
          height: 103,
          color: AppTheme.brandTeal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Stack(
            children: [
              // Menu button
              Positioned(
                left: 13,
                bottom: 20,
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 31),
                  onPressed: () {},
                ),
              ),
              // Title
              Positioned(
                left: 59,
                bottom: 30,
                child: Text(
                  'BARRA TP',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    shadows: [
                      const BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Color.fromARGB(64, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              // Location icon
              Positioned(
                right: 68,
                bottom: 30,
                child: IconButton(
                  icon: const Icon(Icons.location_on, color: Colors.white, size: 42),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
