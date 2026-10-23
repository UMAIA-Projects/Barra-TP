import 'package:flutter/material.dart';
import 'package:desktop/linhas/widgets/transit_tabs.dart';
import 'package:desktop/linhas/widgets/favorites_content.dart';
import 'package:desktop/linhas/models/safe_image.dart';

class TransitContent extends StatelessWidget {
  const TransitContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const TransitTabs(),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
          decoration: const BoxDecoration(
            color: Color(0xFFD4D4D8),
            boxShadow: [
              BoxShadow(
                color: Color(0x40000000),
                offset: Offset(0, 6),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Favoritos - Todas as Linhas',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF475569),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x80000000),
                      offset: Offset(5, 5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: SafeNetworkImage(
                  imageUrl: 'https://api.builder.io/api/v1/image/assets/TEMP/cca9b7a2e97c0b9bffd5d299567baee8a65db7c7?placeholderIfAbsent=true&apiKey=5bf24c79288943a0b813bd69f2b4f279',
                  width: 35,
                  height: 35,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
        const FavoritesContent(),
      ],
    );
  }
}
