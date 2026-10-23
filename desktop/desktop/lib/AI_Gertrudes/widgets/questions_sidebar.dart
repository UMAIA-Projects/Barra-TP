import 'package:flutter/material.dart';

class QuestionsSidebar extends StatelessWidget {
  const QuestionsSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Título
          const Text(
            'Perguntas\nAutomáticas',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF475569),
              height: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 2,
            width: 120,
            color: const Color(0xFF475569),
          ),
          const SizedBox(height: 24),
          
          // Perguntas
          _buildQuestionCard(
            'Qual é a estação de autocarro mais próxima da minha localização?',
            hasIcon: true,
          ),
          const SizedBox(height: 16),
          _buildQuestionCard('Como recarregar o passe?'),
          const SizedBox(height: 16),
          _buildQuestionCard('Quais são os tipos de passes disponíveis?'),
          
          const SizedBox(height: 24),
          
          Container(
            height: 2,
            width: 120,
            color: const Color(0xFF475569),
          ),
          const SizedBox(height: 16),
          
          const Text(
            'Adicione as perguntas aos seus favoritos e consiga respostas com 1 só clique!',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Color(0xFF475569),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildQuestionCard(String question, {bool hasIcon = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              question,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF475569),
                height: 1.3,
              ),
            ),
          ),
          if (hasIcon) ...[
            const SizedBox(width: 8),
            Icon(Icons.star, size: 20, color: Color(0xFFFFA500)),
          ],
        ],
      ),
    );
  }
}