import 'package:flutter/material.dart';
import 'package:desktop/linhas/models/safe_image.dart';
import 'package:desktop/constants/colors.dart';

class MetroLine extends StatelessWidget {
  final String letter;
  final Color bgColor;

  const MetroLine({super.key, required this.letter, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [        
          const Icon(
            Icons.star,
            color: AppColors.metroYellow,
            size: 14,
          ),
        
        const SizedBox(width: 8),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: bgColor,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Color(0x80000000),
                offset: Offset(5, 5),
                blurRadius: 5,
              ),
            ],
          ),
          child: Center(
            child: Text(
              letter,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MetroStations extends StatelessWidget {
  const MetroStations({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SafeNetworkImage(
                imageUrl: 'https://api.builder.io/api/v1/image/assets/TEMP/a74a9f3bc38e296cddf1e93fea60491d08d2db79?placeholderIfAbsent=true&apiKey=5bf24c79288943a0b813bd69f2b4f279',
                width: 55,
                height: 55,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Póvoa do Varzim - Estádio do Dragão',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF475569),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MetroLine(letter: 'B', bgColor: Color(0xFFDC2626)),
                  const SizedBox(width: 16),
                  const Text(
                    'Varziela',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF475569),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4D4D8),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF475569)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x80000000),
                          offset: Offset(5, 5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.access_time,
                          color: Color(0xFF475569),
                          size: 22,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'A Chegar',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF475569),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '50, 16:15',
                    style: TextStyle(fontSize: 10, color: Color(0xFF475569)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          SafeNetworkImage(
            imageUrl: 'https://api.builder.io/api/v1/image/assets/TEMP/f1c7ce45af87873ed22485ef80ec1caa18c1bd51?placeholderIfAbsent=true&apiKey=5bf24c79288943a0b813bd69f2b4f279',
            width: double.infinity,
            height: 4,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SafeNetworkImage(
                imageUrl: 'https://api.builder.io/api/v1/image/assets/TEMP/a2b873ddfbeca8c53cf6431994c61308ff1642f3?placeholderIfAbsent=true&apiKey=5bf24c79288943a0b813bd69f2b4f279',
                width: 55,
                height: 55,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 10),
              const Text(
                'ISMAI - Campanhã',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF475569),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const MetroLine(letter: 'C', bgColor: Color(0xFF65A30D)),
                      const SizedBox(width: 16),
                      const Text(
                        'Campanhã',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      const MetroLine(letter: 'C', bgColor: Color(0xFF65A30D)),
                      const SizedBox(width: 16),
                      const Text(
                        'ISMAI',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      const MetroLine(letter: 'C', bgColor: Color(0xFF65A30D)),
                      const SizedBox(width: 16),
                      const Text(
                        'Fórum Maia',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4D4D8),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF475569)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x80000000),
                          offset: Offset(5, 5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.access_time,
                          color: Color(0xFF475569),
                          size: 22,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'A Chegar',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF475569),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '42, 16:02',
                    style: TextStyle(fontSize: 10, color: Color(0xFF475569)),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4D4D8),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF475569)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x80000000),
                          offset: Offset(5, 5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.access_time,
                          color: Color(0xFF475569),
                          size: 22,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'A Chegar',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF475569),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '22, 15:45',
                    style: TextStyle(fontSize: 10, color: Color(0xFF475569)),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4D4D8),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF475569)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x80000000),
                          offset: Offset(5, 5),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.access_time,
                          color: Color(0xFF475569),
                          size: 22,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'A Chegar',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF475569),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '28, 15:51',
                    style: TextStyle(fontSize: 10, color: Color(0xFF475569)),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}