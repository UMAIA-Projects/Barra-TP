import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';

class PlanningFormWidget extends StatelessWidget {
  const PlanningFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search Fields - todos com mesma largura e altura, em linha, estendendo de uma ponta a outra
        LayoutBuilder(
          builder: (context, constraints) {
            final availableWidth = constraints.maxWidth;
            final fieldWidth = availableWidth / 5;
            
            return Row(
              children: [
                _PlanningField(
                  label: 'Hora de Partida',
                  width: fieldWidth,
                  height: 56,
                ),
                _PlanningField(
                  label: 'Local de Partida',
                  width: fieldWidth,
                  height: 56,
                ),
                _PlanningField(
                  label: 'Local de Destino',
                  width: fieldWidth,
                  height: 56,
                ),
                _PlanningField(
                  label: 'Hora de Chegada',
                  width: fieldWidth,
                  height: 56,
                ),
                _PlanningField(
                  label: 'Adicionar Paragens',
                  width: fieldWidth,
                  height: 56,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 24),
        // Action Buttons - alinhados à direita
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _ActionButton(
              label: 'Os Meus Planeamentos',
              onPressed: () {},
              icon: null,
            ),
            const SizedBox(width: 20),
            _ActionButton(
              label: 'Pesquisa',
              onPressed: () {},
              icon: Icons.search,
            ),
          ],
        ),
      ],
    );
  }
}

class _PlanningField extends StatelessWidget {
  final String label;
  final double width;
  final double height;

  const _PlanningField({
    required this.label,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.barraTeal, width: 2),
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.nunitoSans(
            color: AppColors.barraTeal,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  const _ActionButton({
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.barraTeal,
        padding: EdgeInsets.symmetric(
          horizontal: icon != null ? 24 : 8,
          vertical: icon != null ? 14 : 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        shadowColor: Colors.black.withValues(alpha: 0.25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: GoogleFonts.nunitoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          if (icon != null) ...[
            const SizedBox(width: 10),
            Icon(icon, size: 24, color: Colors.white),
          ],
        ],
      ),
    );
  }
}