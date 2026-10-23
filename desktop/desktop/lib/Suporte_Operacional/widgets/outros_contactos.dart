import 'package:flutter/material.dart';

class OutrosContactos extends StatelessWidget {
  const OutrosContactos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 22,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              offset: const Offset(0, 2),
              blurRadius: 8,
            ),
          ],
        ),
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Outros Contactos',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF475569),
                ),
              ),
            ),
          const SizedBox(height: 24),
          Container(
            height: 2,
            width: double.infinity,
            color: const Color(0xFF475569),
          ),
          const SizedBox(height: 36),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF475569),
                height: 1.67,
              ),
              children: [
                TextSpan(text: 'Email\'s:\n'),
                TextSpan(text: '• barratp@gmail.com\n'),
                TextSpan(text: '• barratpatende@homail.com\n'),
                TextSpan(text: '• barratp2025@umaia.pt\n\n'),
                TextSpan(text: 'Atendimento ao público:\n'),
                TextSpan(text: '• +351 947136849\n'),
                TextSpan(text: '• +351 916940125\n'),
                TextSpan(text: '• +351 925937290\n\n'),
                TextSpan(text: 'Chamadas internacionais:\n'),
                TextSpan(text: '• +55 255061000\n'),
                TextSpan(text: '• +01 255346687\n'),
                TextSpan(text: '• +41 255937290\n\n'),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF475569),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    offset: const Offset(4, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 56, vertical: 12),
                child: Text(
                  'Ligar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      )
    );
  }
}