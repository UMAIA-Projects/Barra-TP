import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF365F67),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 
                Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.45),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 44),
          Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16), //16
                  child: Builder(
                    builder: (ctx) => InkWell(
                      borderRadius: BorderRadius.circular(999),
                      onTap: () {
                        Scaffold.of(ctx).openDrawer();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SvgPicture.asset(
                          'assets/icons/hamburguer.svg',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              /*
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SvgPicture.asset(
                    'assets/icons/hamburguer.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              */
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'BARRA TP',
                    style: GoogleFonts.daysOne(
                      fontSize: 44,
                      fontWeight: FontWeight.w700,
                      color: AppColors.headerText(context),
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 40,
                    child: Image.asset(
                      'assets/images/barra_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      /*
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 44),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: SvgPicture.asset(
                  'assets/icons/hamburguer.svg',
                  width: 24,
                  height: 24,
                  //colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
                ),
              ),
              Text(
                'BARRA TP',
                style: AppTypography.headerText.copyWith(
                  color: AppColors.headerText(context),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: Image.asset(
                  'assets/images/barra_logo.png',
                  //width: 48,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ],
      ),
      */
    );
  }
}
