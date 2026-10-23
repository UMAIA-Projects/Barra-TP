import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MetroHeader extends StatelessWidget implements PreferredSizeWidget {
  const MetroHeader({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(105);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.metroTeal,
      height: 105,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.menu,
                      color: AppColors.white,
                      size: 28,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.location_on,
                      color: AppColors.white,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'BARRA TP',
            style: TextStyle(
              fontFamily: 'DaysOne',
              fontSize: 45,
              color: AppColors.white,
              fontWeight: FontWeight.w400,
              shadows: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
