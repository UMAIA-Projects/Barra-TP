import 'package:flutter/material.dart';
import '../models/car.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category badge and rating
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF365F67),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                car.category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'NunitoSans',
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  car.rating.toStringAsFixed(1).replaceAll('.', ','),
                  style: const TextStyle(
                    color: Color(0xFF365F67),
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'NunitoSans',
                    shadows: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.star, color: Color(0xFF365F67), size: 26),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Car image and price section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 226,
                height: 142,
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
                  car.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.directions_car),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Price and CTA
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Preço para ${car.days} dias:',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF365F67),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'NunitoSans',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${car.price} €',
                    style: const TextStyle(
                      color: Color(0xFF365F67),
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'NunitoSans',
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Rentando ${car.name}...'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF22C55E),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 4,
                    ),
                    child: const Text(
                      'Alugar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'NunitoSans',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Car details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              car.name,
              style: const TextStyle(
                color: Color(0xFF365F67),
                fontSize: 20,
                fontWeight: FontWeight.w900,
                fontFamily: 'NunitoSans',
              ),
            ),
            const SizedBox(height: 12),

            // Details grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 2.5,
              children: [
                // Seats
                _DetailItem(
                  icon: Icons.person,
                  label: '${car.seats} Lugares',
                ),
                // Transmission
                _DetailItem(
                  icon: Icons.settings,
                  label: car.transmission,
                ),
                // Large bags
                _DetailItem(
                  icon: Icons.card_travel,
                  label: '${car.largeBags} Mala${car.largeBags > 1 ? 's' : ''} grande${car.largeBags > 1 ? 's' : ''}',
                ),
                // Small bags
                _DetailItem(
                  icon: Icons.luggage,
                  label: '${car.smallBags} Mala pequena',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _DetailItem({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF365F67), size: 24),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0xFF365F67),
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: 'NunitoSans',
            ),
          ),
        ),
      ],
    );
  }
}
