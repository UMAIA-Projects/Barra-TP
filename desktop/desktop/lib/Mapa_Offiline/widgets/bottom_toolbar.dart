import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/dimensions.dart';

class BottomToolbar extends StatelessWidget {
  const BottomToolbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.bottomBarHeight,
      color: AppColors.barraTeal,
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: AppShadows.dropShadow,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              // Left Content
              Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.white,
                        size: 31,
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'BARRA TP',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'DaysOne',
                        ),
                      ),
                      const SizedBox(width: 64),
                      Text(
                        '© 2025 Barra TP | Todos os direitos reservados',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                    ],
                  ),
                ),
              // Right Icons
              const Spacer(),
              _buildIconButton('assets/icon1.png'),
              const SizedBox(width: 12),
              _buildIconButton(Icons.headphones),
              const SizedBox(width: 12),
              _buildIconButton(Icons.compass_calibration),
              const SizedBox(width: 12),
              _buildIconButton(Icons.help),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(dynamic icon) {
    return Container(
      width: 51,
      height: 51,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimensions.radiusSmall),
        boxShadow: AppShadows.dropShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: icon is IconData
              ? Icon(
                  icon,
                  color: AppColors.barraTeal,
                  size: AppDimensions.mediumIconSize,
                )
              : Image.asset(
                  icon as String,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
