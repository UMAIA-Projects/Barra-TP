import 'package:flutter/material.dart';
import 'package:desktop/linhas/widgets/bus_line_item.dart';

class BusStationsContent extends StatelessWidget {
  const BusStationsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
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
          BusLineItem(
            number: '5M',
            variant: BusVariant.outline,
            arrivalTime: '15:45',
            arrivalNumber: '22',
          ),
          BusLineItem(
            number: '1M',
            variant: BusVariant.outline,
            arrivalTime: '15:51',
            arrivalNumber: '28',
          ),
          BusLineItem(
            number: '604',
            variant: BusVariant.green,
            arrivalTime: '16:20',
            arrivalNumber: '35',
          ),
          BusLineItem(
            number: '201',
            variant: BusVariant.yellow,
            arrivalTime: '16:10',
            arrivalNumber: '38',
          ),
          BusLineItem(
            number: '301',
            variant: BusVariant.cyan,
            arrivalTime: '16:25',
            arrivalNumber: '45',
          ),
          BusLineItem(
            number: '401',
            variant: BusVariant.green,
            arrivalTime: '16:30',
            arrivalNumber: '48',
          ),
          BusLineItem(
            number: '501',
            variant: BusVariant.yellow,
            arrivalTime: '16:40',
            arrivalNumber: '52',
          ),
          BusLineItem(
            number: '601',
            variant: BusVariant.cyan,
            arrivalTime: '16:50',
            arrivalNumber: '58',
          ),
          BusLineItem(
            number: '701',
            variant: BusVariant.green,
            arrivalTime: '17:00',
            arrivalNumber: '62',
          ),
          BusLineItem(
            number: '801',
            variant: BusVariant.yellow,
            arrivalTime: '17:10',
            arrivalNumber: '68',
          ),
          BusLineItem(
            number: '901',
            variant: BusVariant.cyan,
            arrivalTime: '17:20',
            arrivalNumber: '72',
          ),
          BusLineItem(
            number: '1001',
            variant: BusVariant.outline,
            arrivalTime: '17:30',
            arrivalNumber: '75',
          ),
        ],
      ),
    );
  }
}
