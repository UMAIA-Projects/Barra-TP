import 'package:flutter/material.dart';

class NearbyStations extends StatelessWidget {
  const NearbyStations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 340),
      margin: const EdgeInsets.only(top: 48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xFF475569),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F5),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.only(left: 1, right: 1, bottom: 28),
        child: Column(
          children: [
            // Header
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD4D4D8),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Estações mais próximas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF475569),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Image.network(
                      'https://api.builder.io/api/v1/image/assets/b79d8af714094cf39045fc0140cd75fc/c298eadb563cd3d4da0aa3ea22c5f923dee4b05d?placeholderIfAbsent=true',
                      width: 26,
                      height: 25,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            // Station card
            Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFA3A3A3).withValues(alpha: 0.4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                left: 10,
                right: 64,
                top: 6,
                bottom: 6,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Image.network(
                      'https://api.builder.io/api/v1/image/assets/b79d8af714094cf39045fc0140cd75fc/67f22770e125b29a18fed74b8a142d7ca4b87fe1?placeholderIfAbsent=true',
                      width: 17,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ISMAI (Metro)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF475569),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Caminhe 2 minutos | 3506 |',
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Bus routes section
            Container(
              constraints: const BoxConstraints(maxWidth: 298),
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side - Routes
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First route
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF93C5FD),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            child: const Text(
                              '3506',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF475569),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Maia (Centro)',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF475569),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      // Second route
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF5EEAD4),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            child: const Text(
                              '6306',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF475569),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Santo Tirso (Estação)',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF475569),
                                ),
                              ),
                              const SizedBox(height: 28),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    // Handle "ver + 1" tap
                                    print('Ver mais tapped');
                                  },
                                  child: const Text(
                                    'ver + 1',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF475569),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Right side - Schedules
                  Column(
                    children: [
                      Image.network(
                        'https://api.builder.io/api/v1/image/assets/b79d8af714094cf39045fc0140cd75fc/11ea57ad102932d7a60ae0b81e274eb3a9162a70?placeholderIfAbsent=true',
                        width: 60,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        '09:19, 10:09',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF475569),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Image.network(
                        'https://api.builder.io/api/v1/image/assets/b79d8af714094cf39045fc0140cd75fc/a5729b4f9dc0ac8b13fab761ee5af291d285cec7?placeholderIfAbsent=true',
                        width: 60,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                      const Text(
                        '08:19, 9:09',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
