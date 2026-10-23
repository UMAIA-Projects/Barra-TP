import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/responsive_utils.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});
  
  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    return Container(
      width: responsive.scaleWidth(398),
      padding: EdgeInsets.all(responsive.scaleWidth(24)),
      decoration: BoxDecoration(
        color: BarraColors.teal,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(responsive.borderRadius(24)),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.15),
            blurRadius: responsive.scaleWidth(4),
            offset: Offset(0, responsive.scaleHeight(2)),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: responsive.scaleWidth(24)),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gertrudes Silva',
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.white,
                      fontSize: responsive.scaleFontSize(22),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    'Saldo: 22,50€',
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.white,
                      fontSize: responsive.scaleFontSize(22),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: responsive.spacing(16)),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: responsive.scaleUniform(85),
                height: responsive.scaleUniform(85),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(responsive.scaleUniform(12)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.1),
                      blurRadius: responsive.scaleUniform(4),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.person,
                  color: BarraColors.teal,
                  size: responsive.scaleUniform(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
