import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class StationBadge extends StatelessWidget {
  final String stationName;

  const StationBadge({
    Key? key,
    required this.stationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.metroTealLight,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.metroTeal,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          stationName,
          style: const TextStyle(
            fontFamily: 'DaysOne',
            fontSize: 14,
            color: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
