import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onLocationTap;

  const CustomHeader({
    Key? key,
    this.onMenuTap,
    this.onLocationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.primaryColor,
      child: Column(
        children: [
          Container(
            height: 58,
            color: AppTheme.primaryColor,
          ),
          Container(
            height: 53,
            color: AppTheme.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: onMenuTap ?? () {},
                    child: const Icon(
                      Icons.menu,
                      color: Color(0xFFE3E3E3),
                      size: 28,
                    ),
                  ),
                ),
                Text(
                  'BARRA TP',
                  style: GoogleFonts.daysOne(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: onLocationTap ?? () {},
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

