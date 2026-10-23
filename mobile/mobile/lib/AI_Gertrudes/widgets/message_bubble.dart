import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../../theme/app_colors.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: message.isUser
                  ? AppColors.lightColorScheme.primary
                  : const Color(0xFFE8E8E8),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                color: message.isUser ? Colors.white : AppColors.lightTextPrimary,
                fontSize: 14,
                fontFamily: 'NunitoSans',
              ),
            ),
          ),
        ],
      ),
    );
  }
}