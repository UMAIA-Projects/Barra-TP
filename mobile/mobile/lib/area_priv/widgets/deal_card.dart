import 'package:flutter/material.dart';
import '../models/deal.dart';

class DealCard extends StatelessWidget {
  final Deal deal;

  const DealCard({
    Key? key,
    required this.deal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      width: isMobile ? 277 : 300,
      height: isMobile ? 180 : 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 3),
            blurRadius: 3,
            color: Colors.black.withValues(alpha: 0.25),
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Image.network(
              deal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 42,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF365F67),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 3.7),
                    blurRadius: 3.7,
                    color: Colors.black.withValues(alpha: 0.25),
                  ),
                ],
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'De ${deal.from} Para ${deal.to}',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF365F67),
                borderRadius: BorderRadius.circular(5.5),
              ),
              child: Text(
                deal.price,
                style: const TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: 16,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.chevron_right,
                color: Color(0xFF365F67),
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
