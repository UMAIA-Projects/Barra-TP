import 'package:flutter/material.dart';

class ArrivalButton extends StatelessWidget {
  final String time;
  final String number;

  const ArrivalButton({
    super.key,
    required this.time,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
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
        Text(
          '$number, $time',
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF475569),
          ),
        ),
      ],
    );
  }
}
