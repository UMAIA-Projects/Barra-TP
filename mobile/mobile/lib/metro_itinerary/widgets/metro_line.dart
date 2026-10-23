import 'package:flutter/material.dart';
import '../models/station_model.dart';
import 'station_item.dart';
import '../theme/colors.dart';

class MetroLine extends StatelessWidget {
  const MetroLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          stations.length,
          (index) => StationItem(
            station: stations[index],
            showLine: index < stations.length - 1,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: AppColors.metroText,
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Fim de Viagem - 9 minutos',
              style: TextStyle(
                color: AppColors.metroText,
                fontFamily: 'DaysOne',
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
