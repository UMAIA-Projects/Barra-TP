import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';

class Sidebar extends StatelessWidget {
  final int currentPage;
  final Function(int) onPageChanged;

  const Sidebar({
    Key? key,
    required this.currentPage,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationItems = [
      {'name': 'Consulta', 'icon': Icons.search, 'color': AppColors.mintGreen},
      {'name': 'Planeamento', 'icon': Icons.map, 'color': AppColors.cyanLight},
      {'name': 'Linhas', 'icon': Icons.timeline, 'color': AppColors.mintGreen},
      {'name': 'Aluguer', 'icon': Icons.directions_car, 'color': AppColors.cyanLight},
      {'name': 'Mapa Offline', 'icon': Icons.location_on, 'color': AppColors.mintGreen},
      {'name': 'Área Privada', 'icon': Icons.lock, 'color': AppColors.cyanLight},
    ];

    return Container(
      width: 380,
      color: AppColors.bgLight,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
        child: Column(
          children: [
            // Logo Section
            _buildLogoSection(),
            const SizedBox(height: 32),
            // Navigation Items
            ...List.generate(
              navigationItems.length,
              (index) => _buildNavigationItem(
                name: navigationItems[index]['name'] as String,
                icon: navigationItems[index]['icon'] as IconData,
                bgColor: navigationItems[index]['color'] as Color,
                isSelected: currentPage == index,
                onTap: () => onPageChanged(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Container(
      width: 340,
      height: 230,
      decoration: BoxDecoration(
        color: AppColors.barraTealDark,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [AppShadows.defaultShadow],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 40,
            top: 32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BARRA',
                  style: GoogleFonts.daysOne(
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    height: 1.2,
                  ),
                ),
                Text(
                  'TP',
                  style: GoogleFonts.daysOne(
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    height: 1.2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 24,
            bottom: 32,
            child: Icon(
              Icons.location_on,
              size: 64,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationItem({
    required String name,
    required IconData icon,
    required Color bgColor,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 340,
        height: 120,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [AppShadows.defaultShadow],
          border: isSelected ? Border.all(color: AppColors.barraTealDark, width: 2) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 51,
                    color: AppColors.barraTealDark,
                  ),
                  const SizedBox(width: 24),
                  Text(
                    name,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.barraTealDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
