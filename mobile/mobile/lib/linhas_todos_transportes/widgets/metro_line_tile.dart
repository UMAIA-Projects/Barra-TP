import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/metro_line.dart';

class MetroLineTile extends StatelessWidget {
  final MetroLine line;

  const MetroLineTile({
    Key? key,
    required this.line,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lineColor = getLineColor(line.id);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          // Line circle badge
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: lineColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                line.id,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Line name
          Expanded(
            child: Text(
              line.name,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: BarraTPColors.teal,
              ),
            ),
          ),
          // Ver Estações button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: BarraTPColors.mediumGray,
              border: Border.all(color: BarraTPColors.teal, width: 1),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 2.9,
                  offset: const Offset(2.9, 2.9),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.dashboard,
                  size: 14,
                  color: BarraTPColors.teal,
                ),
                const SizedBox(width: 4),
                const Text(
                  'Ver Estações',
                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w600,
                    color: BarraTPColors.teal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
