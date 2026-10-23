import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/routes.dart';
import 'package:desktop/constants/responsive_utils.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    return Container(
      height: responsive.footerHeight,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: responsive.scaleHeight(24),
        bottom: responsive.scaleHeight(24),
        left: responsive.scaleWidth(30),
        right: responsive.scaleWidth(16),
      ),
      color: BarraColors.teal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'BARRA TP',
            style: GoogleFonts.daysOne(
              color: AppColors.white,
              fontSize: responsive.scaleFontSize(20),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(width: responsive.spacing(8)),
          Icon(
            Icons.location_on,
            color: AppColors.white,
            size: responsive.iconSize(24),
          ),
          SizedBox(width: responsive.spacing(48)),

          Text(
            '© 2025 Barra TP | Todos os direitos reservados',
            style: GoogleFonts.nunitoSans(
              color: AppColors.white,
              fontSize: responsive.scaleFontSize(12),
              fontWeight: FontWeight.w500,
            ),
          ),

          const Spacer(),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _FooterIcon(
                icon: Icons.reviews,
                onTap: () => Navigator.pushNamed(context, AppRoutes.avaliacao),
              ),
              SizedBox(width: responsive.spacing(8)),
              _FooterIcon(
                icon: Icons.support_agent,
                onTap: () => Navigator.pushNamed(context, AppRoutes.suporte),
              ),
              SizedBox(width: responsive.spacing(8)),
              _FooterIcon(
                icon: Icons.explore,
                onTap: () => Navigator.pushNamed(context, AppRoutes.aiGertrudes),
              ),
              SizedBox(width: responsive.spacing(8)),
              _FooterIcon(
                icon: Icons.help_outline,
                onTap: () => Navigator.pushNamed(context, AppRoutes.saberMais),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _FooterIcon({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final size = responsive.scaleUniform(48);
    
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(responsive.scaleUniform(4)),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(responsive.scaleUniform(4)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.1),
              blurRadius: responsive.scaleUniform(4),
              offset: Offset(0, responsive.scaleUniform(2)),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: BarraColors.teal,
          size: responsive.scaleUniform(24),
        ),
      ),
    );
  }
}
