import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/dimensions.dart';

class SatelliteControls extends StatelessWidget {
  final bool expanded;
  final bool isSatelliteView;
  final VoidCallback onToggle;
  final VoidCallback onViewToggle;

  const SatelliteControls({
    Key? key,
    this.expanded = false,
    this.isSatelliteView = true,
    required this.onToggle,
    required this.onViewToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        Container(
          width: 244,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.barraTeal,
            borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
            boxShadow: AppShadows.dropShadow,
          ),
          child: Material(
            color: AppColors.transparent,
            child: InkWell(
              onTap: onViewToggle,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isSatelliteView ? 'Satélite' : 'Mapa',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'NunitoSans',
                      ),
                    ),
                    Icon(
                      expanded ? Icons.expand_less : Icons.expand_more,
                      color: AppColors.white,
                      size: 70,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (expanded) ...[
          const SizedBox(height: 12),
          Container(
            width: 244,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.barraTeal,
              borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
              boxShadow: AppShadows.dropShadow,
            ),
            child: Material(
              color: AppColors.transparent,
              child: InkWell(
                onTap: () {},
                child: const Center(
                  child: Text(
                    'Definir Área',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'NunitoSans',
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            width: 244,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.barraTeal,
              borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
              boxShadow: AppShadows.dropShadow,
            ),
            child: Material(
              color: AppColors.transparent,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Download',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                      Icon(
                        Icons.download,
                        color: AppColors.white,
                        size: 51,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}