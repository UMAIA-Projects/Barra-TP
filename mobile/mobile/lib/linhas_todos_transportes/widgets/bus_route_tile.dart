import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/metro_line.dart';

class BusRouteTile extends StatelessWidget {
  final BusRoute route;

  const BusRouteTile({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          // Bus number badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: BarraTPColors.teal, width: 1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.directions_bus,
                  size: 16,
                  color: BarraTPColors.teal,
                ),
                const SizedBox(width: 4),
                Text(
                  route.id,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: BarraTPColors.teal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Start point
          const Text(
            'Aliados',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: BarraTPColors.teal,
            ),
          ),
          const SizedBox(width: 8),
          // Arrow icon
          const Icon(
            Icons.arrow_forward,
            size: 12,
            color: BarraTPColors.teal,
          ),
          const SizedBox(width: 8),
          // Destination
          Expanded(
            child: Text(
              route.destination,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: BarraTPColors.teal,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
