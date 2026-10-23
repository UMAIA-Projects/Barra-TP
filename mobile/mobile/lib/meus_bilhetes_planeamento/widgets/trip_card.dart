import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../models/trip.dart';

class TripCard extends StatelessWidget {
  final Trip trip;

  const TripCard({Key? key, required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Origin and Destination
        Row(
          children: [
            Expanded(
              child: Text(
                '${trip.origin} > ${trip.destination}',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 4,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
              ),
              child: const Text(
                'Comprar',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Trip Legs
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...trip.legs.asMap().entries.map((entry) {
              int index = entry.key;
              var leg = entry.value;
              return Row(
                children: [
                  _buildTripLegWidget(leg),
                  if (index < trip.legs.length - 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        Icons.chevron_right,
                        color: AppColors.primary,
                        size: 18,
                      ),
                    ),
                ],
              );
            }).toList(),
          ],
        ),
        const SizedBox(height: 12),
        // Time and Action Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${trip.startTime} - ${trip.endTime}',
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 4,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                  ),
                  child: const Text(
                    'Comprar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.busOrange,
                    elevation: 4,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                  ),
                  child: const Text(
                    'Eliminar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 4,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                  ),
                  child: const Text(
                    'Editar',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Divider(
          color: AppColors.primary,
          thickness: 2.8,
        ),
      ],
    );
  }

  Widget _buildTripLegWidget(var leg) {
    if (leg.type == 'walk') {
      return Icon(
        Icons.directions_walk,
        color: AppColors.primary,
        size: 20,
      );
    } else if (leg.type == 'metro') {
      if (leg.letter != null) {
        return Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: leg.color ?? AppColors.busPurple,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(2, 2),
                blurRadius: 2,
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          ),
          child: Center(
            child: Text(
              leg.letter!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            ),
          ),
        );
      }
      return Icon(
        Icons.directions_subway,
        color: AppColors.primary,
        size: 20,
      );
    } else if (leg.type == 'bus') {
      return Container(
        decoration: BoxDecoration(
          color: leg.color ?? AppColors.busYellow,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: 2,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [
            Icon(
              Icons.directions_bus,
              color: AppColors.primary,
              size: 16,
            ),
            const SizedBox(width: 4),
            Text(
              leg.line ?? '',
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
