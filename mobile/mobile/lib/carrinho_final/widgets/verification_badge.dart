import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationBadge extends StatelessWidget {
  const VerificationBadge({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return Container(
    width: double.infinity,
    // Força o Azul-Verde definido no seu primary (0xFF365F67)
    color: Theme.of(context).colorScheme.primary, 
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        const SizedBox(width: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            // Camada branca com transparência para o retângulo interno
            color: Colors.white.withValues(alpha: 0.15), 
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.white24),
          ),
          child: Text(
            'Verificação do Carrinho',
            style: GoogleFonts.daysOne(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
}