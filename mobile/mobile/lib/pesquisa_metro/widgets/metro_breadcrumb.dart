import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MetroBreadcrumb extends StatelessWidget {
  final String lineCode;
  final String location;

  const MetroBreadcrumb({
    Key? key,
    required this.lineCode,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.metroTealLight,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 32,
            height: 32,
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
                lineCode,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: AppColors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              location,
              style: const TextStyle(
                fontFamily: 'NunitoSans',
                fontSize: 12,
                color: AppColors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
