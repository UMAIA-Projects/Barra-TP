import 'package:flutter/material.dart';
import 'package:desktop/linhas/widgets/train_line_item.dart';
import 'package:desktop/linhas/widgets/bus_line_item.dart';
import 'package:desktop/linhas/widgets/metro_line_item.dart';

class AllLinesContent extends StatelessWidget {
  const AllLinesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'Comboios - Linhas',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF475569),
                ),
              ),
            ),
            TrainLineItem(
              name: 'Guimarães',
              color: TrainColor.red,
              arrivalTime: '16:15',
              arrivalNumber: '50',
            ),
            TrainLineItem(
              name: 'Aveiro - Granja',
              color: TrainColor.orange,
              arrivalTime: '16:30',
              arrivalNumber: '42',
            ),
            TrainLineItem(
              name: 'Aveiro',
              color: TrainColor.yellow,
              arrivalTime: '15:45',
              arrivalNumber: '22',
            ),
            TrainLineItem(
              name: 'Braga',
              color: TrainColor.green,
              highlighted: true,
              arrivalTime: '16:02',
              arrivalNumber: '42',
            ),
            TrainLineItem(
              name: 'Caíde - Marco',
              color: TrainColor.cyan,
              arrivalTime: '15:51',
              arrivalNumber: '28',
            ),
            TrainLineItem(
              name: 'Leixões',
              color: TrainColor.magenta,
              arrivalTime: '16:20',
              arrivalNumber: '35',
            ),
            TrainLineItem(
              name: 'Porto - Valongo',
              color: TrainColor.purple,
              arrivalTime: '16:10',
              arrivalNumber: '38',
            ),
            TrainLineItem(
              name: 'Minho',
              color: TrainColor.blue,
              arrivalTime: '16:25',
              arrivalNumber: '45',
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'Autocarros - Linhas',
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
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'Metros - Linhas',
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
            MetroLineItem(
              line: 'Bx',
              status: 'Operacional',
              color: MetroColor.red,
            ),
            MetroLineItem(
              line: 'C',
              status: 'Operacional',
              color: MetroColor.green,
            ),
            MetroLineItem(
              line: 'D',
              status: 'Operacional',
              color: MetroColor.yellow,
            ),
            MetroLineItem(
              line: 'E',
              status: 'Operacional',
              color: MetroColor.purple,
            ),
            MetroLineItem(
              line: 'F',
              status: 'Operacional',
              color: MetroColor.orange,
            ),
          ],
        ),
      ),
    );
  }
}
