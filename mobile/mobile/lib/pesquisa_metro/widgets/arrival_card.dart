import 'package:flutter/material.dart';
import '../models/metro_models.dart';
import '../theme/app_theme.dart';

class ArrivalCard extends StatelessWidget {
  final MetroLine line;

  const ArrivalCard({
    Key? key,
    required this.line,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.metroCard,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.metroGreen,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    line.lineCode,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      color: AppColors.white,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                line.name,
                style: const TextStyle(
                  fontFamily: 'DaysOne',
                  fontSize: 13,
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.metroCardLight,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: AppColors.metroTeal,
                width: 1,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 14,
                  color: AppColors.metroTeal,
                ),
                const SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${line.arrivalMinutes} min',
                      style: const TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 8,
                        color: AppColors.metroTeal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      line.arrivalTime,
                      style: const TextStyle(
                        fontFamily: 'NunitoSans',
                        fontSize: 6,
                        color: AppColors.metroTeal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
