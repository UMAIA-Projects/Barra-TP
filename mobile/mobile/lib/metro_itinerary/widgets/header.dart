import 'package:flutter/material.dart';
import '../theme/colors.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 105,
      color: AppColors.metroTeal,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white, size: 28),
              onPressed: () {},
            ),
          ),
          Text(
            'BARRA TP',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              fontFamily: 'DaysOne',
              fontSize: 45,
              fontWeight: FontWeight.w400,
              shadows: [
                Shadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.location_on, color: Colors.white, size: 28),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
