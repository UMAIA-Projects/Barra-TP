import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ArrivalsHeader extends StatelessWidget {
  const ArrivalsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.metroTealLight,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
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
                child: const Center(
                  child: SizedBox.shrink(),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Próximas Chegadas à Paragem',
                style: TextStyle(
                  fontFamily: 'DaysOne',
                  fontSize: 13,
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            'Próximas chegadas de linhas a esta paragem',
            style: TextStyle(
              fontFamily: 'NunitoSans',
              fontSize: 9,
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
