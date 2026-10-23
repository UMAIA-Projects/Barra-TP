import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../models/chat_input.dart';

class ContactContent extends StatelessWidget {
  const ContactContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 52,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Contacte-nos',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF475569),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            height: 2,
            width: double.infinity,
            color: const Color(0xFF475569),
          ),
          const SizedBox(height: 36),
          const Text(
            'Precisa de ajuda? Não hesite em ligar-nos! Temos pessoas disponíveis para atendê-lo 24 horas por dia!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF475569),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Pode começar já, escrevendo uma mensagem aqui mesmo para a nossa equipa.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF475569),
              height: 1.5,
            ),
          ),
          const SizedBox(height: 36),
          Container(
            height: 2,
            width: double.infinity,
            color: const Color(0xFF475569),
          ),
          const SizedBox(height: 32),
          const ChatMessage(
            isFromTP: true,
            message: 'Em que podemos ajudar?',
            timestamp: '01:53 10 outubro 2025',
          ),
          const SizedBox(height: 56),
          const ChatMessage(
            isFromTP: false,
            message: 'Posso comprar uma viagem para Lisboa?',
            timestamp: '01:54 10 outubro 2025',
            avatar: 'https://api.builder.io/api/v1/image/assets/TEMP/e96d827d37d69cfc85effaa17e79b54ef84e7284?placeholderIfAbsent=true&apiKey=8c0df797c7ad4798ac7038148870966f',
          ),
          const SizedBox(height: 28),
          const ChatMessage(
            isFromTP: true,
            message: 'Claro! Qual meio de transporte vai desejar?',
            timestamp: '01:55 10 outubro 2025',
          ),
          const SizedBox(height: 40),
          const ChatInput(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}