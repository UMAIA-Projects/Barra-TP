import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../models/metro_line.dart';
import '../../common/linhas_navigation_helper.dart';

class MetroLineCard extends StatelessWidget {
  final MetroLine line;
  final bool showDivider;

  const MetroLineCard({
    Key? key,
    required this.line,
    this.showDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Line badge and name
              Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: line.color,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        line.label,
                        style: GoogleFonts.roboto(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    line.name,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              // Ver Estações button
              ElevatedButton.icon(
                onPressed: () {
                  LinhasNavigationHelper.navigateToMetroItinerary(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBackground,
                  foregroundColor: AppColors.textPrimary,
                  side: const BorderSide(
                    color: AppColors.buttonBorder,
                    width: 0.73,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.8),
                  ),
                  elevation: 2,
                ),
                icon: SizedBox(
                  width: 14,
                  height: 14,
                  child: Image.asset(
                    'assets/icons/stations.png',
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.view_list,
                        size: 14,
                        color: AppColors.textPrimary,
                      );
                    },
                  ),
                ),
                label: Text(
                  'Ver Estações',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(
            color: AppColors.dividerColor,
            height: 1,
            thickness: 1,
          ),
      ],
    );
  }
}
