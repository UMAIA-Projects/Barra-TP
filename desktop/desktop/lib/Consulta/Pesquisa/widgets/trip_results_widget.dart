import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';

class TripResultsWidget extends StatelessWidget {
  const TripResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTripCard(
          origin: '15:30\nLisboa (Oriente)',
          destination: '18:50\nPorto (Campanhã)',
          duration: 'direto 03h 20m, 306km',
          price: '7,50€',
          places: '1 lugar (adulto)',
        ),
        const SizedBox(height: 16),
        _buildTripCard(
          origin: '08:15\nPorto (Campanhã)',
          destination: '11:30\nLisboa (Oriente)',
          duration: 'direto 03h 15m, 306km',
          price: '7,50€',
          places: '1 lugar (adulto)',
        ),
        const SizedBox(height: 16),
        _buildTripCard(
          origin: '14:00\nLisboa (Oriente)',
          destination: '17:45\nCoimbra-B',
          duration: '1 transbordo 03h 45m, 205km',
          price: '12,00€',
          places: '2 lugares disponíveis',
        ),
        const SizedBox(height: 16),
        _buildTripCard(
          origin: '20:30\nPorto (Campanhã)',
          destination: '23:50\nLisboa (Oriente)',
          duration: 'direto 03h 20m, 306km',
          price: '9,00€',
          places: '1 lugar (adulto)',
        ),
      ],
    );
  }

  Widget _buildTripCard({
    required String origin,
    required String destination,
    required String duration,
    required String price,
    required String places,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF475569), width: 2),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            // Mobile/narrow layout
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Barra TP',
                  style: GoogleFonts.daysOne(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: AppColors.barraTeal,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  origin,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF6B7280),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'ITINERÁRIO',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: AppColors.barraTeal,
                      decoration: TextDecoration.underline,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Icon(Icons.arrow_forward, size: 40, color: AppColors.barraTeal),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    destination,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF6B7280),
                      height: 1.3,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildDurationText(duration),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: Color(0xFF6B7280),
                          ),
                        ),
                        Text(
                          places,
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 10,
                            color: Color(0xFFF52424),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.barraTeal,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Adicionar Lugar',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            // Desktop/wide layout - mais compacto
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left section
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Barra TP',
                        style: GoogleFonts.daysOne(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: AppColors.barraTeal,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        origin,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF6B7280),
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'ITINERÁRIO',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: AppColors.barraTeal,
                            decoration: TextDecoration.underline,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Center arrow
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.arrow_forward, size: 50, color: AppColors.barraTeal),
                ),
                // Right section
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        destination,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF6B7280),
                          height: 1.3,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildDurationText(duration),
                    ],
                  ),
                ),
                // Price section
                SizedBox(
                  width: 180,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: price,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 26,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                              TextSpan(
                                text: '\n$places',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 11,
                                  color: Color(0xFFF52424),
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.right,
                          style: const TextStyle(height: 1.6),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.barraTeal,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Adicionar Lugar',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildDurationText(String duration) {
    final parts = duration.split(' ');
    final isDirect = parts[0] == 'direto';
    final isTransbordo = parts.length > 1 && parts[0] == '1' && parts[1] == 'transbordo';
    
    String prefix = '';
    String rest = duration;
    
    if (isDirect) {
      prefix = 'direto';
      rest = duration.substring(7);
    } else if (isTransbordo) {
      prefix = '1 transbordo';
      rest = duration.substring(13);
    }
    
    return Text.rich(
      TextSpan(
        children: [
          if (prefix.isNotEmpty)
            TextSpan(
              text: prefix,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w900,
                color: Color(0xFFF52424),
              ),
            ),
          if (prefix.isNotEmpty) TextSpan(text: ' '),
          TextSpan(
            text: rest,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w900,
              color: Color(0xFF6B7280),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.right,
    );
  }
}