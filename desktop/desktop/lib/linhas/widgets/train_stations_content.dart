import 'package:flutter/material.dart';
import 'package:desktop/linhas/widgets/train_line_item.dart';

class TrainStationsContent extends StatelessWidget {
  const TrainStationsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
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
          TrainLineItem(
            name: 'Coimbra',
            color: TrainColor.red,
            arrivalTime: '17:00',
            arrivalNumber: '60',
          ),
          TrainLineItem(
            name: 'Lisboa',
            color: TrainColor.orange,
            arrivalTime: '18:30',
            arrivalNumber: '120',
          ),
          TrainLineItem(
            name: 'Sintra',
            color: TrainColor.yellow,
            arrivalTime: '16:40',
            arrivalNumber: '50',
          ),
          TrainLineItem(
            name: 'Cascais',
            color: TrainColor.green,
            arrivalTime: '16:50',
            arrivalNumber: '55',
          ),
          TrainLineItem(
            name: 'Setúbal',
            color: TrainColor.cyan,
            arrivalTime: '17:15',
            arrivalNumber: '70',
          ),
        ],
      ),
    );
  }
}
