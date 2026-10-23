import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/responsive_utils.dart';
import 'package:desktop/Alertas/screens/alertas_screen.dart';
import 'package:desktop/Definicoes/screens/definicoes_screen.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const ActionButton({
    required this.icon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final size = responsive.scaleUniform(48);
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: BarraColors.teal,
          borderRadius: BorderRadius.circular(responsive.scaleUniform(12)),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.1),
              blurRadius: responsive.scaleUniform(4),
              offset: Offset(0, responsive.scaleUniform(2)),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: AppColors.white,
          size: responsive.scaleUniform(24),
        ),
      ),
    );
  }
}

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ActionButton(
          icon: Icons.notifications,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AlertasScreen(),
              ),
            );
          },
        ),
        SizedBox(width: responsive.spacing(12)),
        ActionButton(
          icon: Icons.settings,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DefinicoesScreen(),
              ),
            );
          },
        ),
      ],
    );
  }
}
