import 'package:flutter/material.dart';
import '../../descontos_disponiveis/constants/colors.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.brandTealLight,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        children: [
          Image.network(
            'https://api.builder.io/api/v1/image/assets/TEMP/37d5d07baf867e597bed9bdb8b0e8cf1c3c7dc91?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
            width: 16,
            height: 16,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.arrow_back, color: Colors.white, size: 16);
            },
          ),
          const SizedBox(width: 4),
          Row(
            children: [
              // REMOVIDA A SOMBRA AQUI
              Image.network(
                'https://api.builder.io/api/v1/image/assets/TEMP/4858b3d2d893c6b0fedc4c4d04952b411300a64a?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                width: 24,
                height: 24,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.search, color: Colors.white, size: 24);
                },
              ),
              const SizedBox(width: 4),
              const Text(
                'Pesquisa',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}