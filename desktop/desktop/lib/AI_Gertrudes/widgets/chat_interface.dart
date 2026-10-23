import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/AI_Gertrudes/models/chat_input.dart';

class ChatInterface extends StatelessWidget {
  const ChatInterface({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          const Text(
            'AI Gertrudes',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppColors.slate700,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: double.infinity,
            color: AppColors.slate700,
          ),
          const SizedBox(height: 24),
          
          // Texto descritivo
          const Text(
            'Precisa de ajuda? A nossa AI consegue ajudá-lo em qualquer situação. '
            'Esclareça todas as suas dúvidas e compre até viagens!',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.slate700,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Envie uma mensagem para começar a conversar.',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.slate700,
              height: 1.5,
            ),
          ),
          
          const SizedBox(height: 40),
          
          // Logo AI Gertrudes
          Center(
            child: Column(
              children: [
                Text(
                  'AI Gertrudes',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.slate700,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  'EM SEU DISPOR',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.slate400,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 40),
          
          // Primeira mensagem da AI
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.slate700,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'AI',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      decoration: BoxDecoration(
                        color: AppColors.slate100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Em que posso ajudar?',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: AppColors.slate700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.thumb_up_outlined, size: 16, color: AppColors.slate500),
                        const SizedBox(width: 12),
                        Icon(Icons.thumb_down_outlined, size: 16, color: AppColors.slate500),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 32),
          
          // Mensagem do usuário
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(
                    color: AppColors.slate100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Posso comprar uma viagem para Braga?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.slate700,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.slate700,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.person,
                  color: AppColors.white,
                  size: 28,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 40),
          
          // Input de mensagem
          const ChatInput(),
        ],
      ),
    );
  }
}