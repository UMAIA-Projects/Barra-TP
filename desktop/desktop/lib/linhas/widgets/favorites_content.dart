import 'package:flutter/material.dart';
import 'package:desktop/linhas/widgets/train_line_item.dart';
import 'package:desktop/linhas/widgets/bus_line_item.dart';
import 'package:desktop/linhas/widgets/metro_line_item.dart';

class FavoritesContent extends StatelessWidget {
  const FavoritesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'Comboios Favoritos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF475569),
              ),
            ),
          ),
          TrainLineItem(
            name: 'Braga',
            color: TrainColor.green,
            highlighted: true,
            arrivalTime: '16:02',
            arrivalNumber: '42',
          ),
          TrainLineItem(
            name: 'Porto - Valongo',
            color: TrainColor.purple,
            arrivalTime: '16:10',
            arrivalNumber: '38',
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'Autocarros Favoritos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF475569),
              ),
            ),
          ),
          BusLineItem(
            number: '504',
            variant: BusVariant.yellow,
            arrivalTime: '16:15',
            arrivalNumber: '50',
          ),
          BusLineItem(
            number: '203',
            variant: BusVariant.cyan,
            arrivalTime: '16:02',
            arrivalNumber: '42',
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              'Metros Favoritos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF475569),
              ),
            ),
          ),
          MetroLineItem(
            line: 'A',
            status: 'Operacional',
            color: MetroColor.cyan,
          ),
          MetroLineItem(
            line: 'B',
            status: 'Operacional',
            color: MetroColor.red,
          ),
        ],
      ),
    );
  }
}
