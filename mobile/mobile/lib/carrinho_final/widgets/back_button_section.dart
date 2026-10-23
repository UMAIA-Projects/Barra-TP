import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class BackButtonSection extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackButtonSection({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // Usando o azul esverdeado do seu tema
      color: const Color.fromRGBO(54, 95, 103, 1), 
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
            onPressed: onPressed ?? () => Navigator.pop(context),
          ),
          Text(
            'Retornar',
            style: TextStyle(
              fontFamily: 'Inter', // Conforme sua AppTypography
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}