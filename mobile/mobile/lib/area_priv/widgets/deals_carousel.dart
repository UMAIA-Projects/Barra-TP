import 'package:flutter/material.dart';
import '../models/deal.dart';
import 'deal_card.dart';

class DealsCarousel extends StatelessWidget {
  const DealsCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 12.0 : 16.0,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16.0 : 24.0,
              vertical: 8.0,
            ),
            child: Text(
              'Verifique as Novidades nos Descontos - Adquira já!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'DaysOne',
                fontSize: isMobile ? 9 : 11,
                color: const Color(0xFF365F67),
              ),
            ),
          ),
          SizedBox(
            height: isMobile ? 180 : 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16.0 : 24.0,
              ),
              itemCount: deals.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: DealCard(deal: deals[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
