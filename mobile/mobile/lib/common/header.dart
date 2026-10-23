import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    return Material(
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.45),
      color: Theme.of(context).colorScheme.primary,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'BARRA TP',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  width: 56,
                  height: 56,
                  padding: const EdgeInsets.only(top: 6, bottom: 4),
                  child: Image.asset(
                    'assets/images/barra_logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
    */
    return Container(
      width: double.infinity,
      //constraints: const BoxConstraints(minHeight: 112),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 
                Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.45),
            //color: Colors.black.withValues(alpha: 0.45),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 44),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'BARRA TP',
                style: AppTypography.headerText.copyWith(
                  color: AppColors.headerText(context),
                ),
                /*
                style: TextStyle(
                  fontSize: 44, //48
                  color: AppColors.headerText(context),
                  //color: Colors.white,
                  //fontWeight: FontWeight.normal,
                  fontWeight: FontWeight.w700,
                ),
                */
              ),
              const SizedBox(width: 10),
              /*
              Image.asset(
                'assets/images/barra_logo.png',
                width: 36,
                height: 36,
                fit: BoxFit.contain,
              ),
              */
              Container(
                //width: 50, //28
                //height: 50, //36
                padding: const EdgeInsets.only(top: 6, bottom: 4),
                child: Image.asset(
                  'assets/images/barra_logo.png',
                  //width: 48,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          //const SizedBox(height: 20),
        ],
      ),
    );
  }
}
