import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';

class MetroLineItem extends StatelessWidget {
  final String line;
  final String status;
  final MetroColor color;

  const MetroLineItem({
    Key? key,
    required this.line,
    required this.status,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = _getMetroColor(color);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
                // Metro circle badge
                Container(
                  width: 39,
                  height: 39,
                  decoration: BoxDecoration(
                    color: bgColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.shadowColor,
                        blurRadius: 5.2,
                        offset: const Offset(5.2, 5.2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      line,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Status text
                Text(
                  status,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
          ),
        ],
      ),
    );
  }

  Color _getMetroColor(MetroColor color) {
    switch (color) {
      case MetroColor.cyan:
        return AppColors.metroCyan;
      case MetroColor.red:
        return AppColors.metroRed;
      case MetroColor.green:
        return AppColors.metroGreen;
      case MetroColor.yellow:
        return AppColors.metroYellow;
      case MetroColor.purple:
        return AppColors.metroPurple;
      case MetroColor.orange:
        return AppColors.metroOrange;
    }
  }
}

enum MetroColor { cyan, red, green, yellow, purple, orange }
