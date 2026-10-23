import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';
import '../../theme/app_colors.dart';
import '../widgets/message_bubble.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _messageController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text;
    if (text.trim().isNotEmpty) {
      context.read<ChatProvider>().sendMessage(text);
      _messageController.clear();

      // Scroll to bottom after sending
      Future.delayed(const Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidth = isMobile ? screenWidth : 440.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const HeaderApp(),
          // Back button section
          Container(
            width: double.infinity,
            color: AppColors.lightColorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Retornar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NunitoSans',
                  ),
                ),
              ],
            ),
          ),
          // AI Tab
          Container(
            width: double.infinity,
            color: AppColors.grayLight,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.lightColorScheme.primary,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Text(
                'AI Gertrudes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: 'DaysOne',
                ),
              ),
            ),
          ),
          // Messages area
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, chatProvider, _) {
                if (chatProvider.messages.isEmpty) {
                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Em que posso ajudar?',
                            style: TextStyle(
                              color: AppColors.lightColorScheme.primary,
                              fontSize: 16,
                              fontFamily: 'DaysOne',
                            ),
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: maxWidth - 80,
                            child: TextField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: 'Escreva alguma coisa...',
                                hintStyle: const TextStyle(
                                  color: Color.fromARGB(179, 0, 0, 0),
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: AppColors.lightColorScheme.primary, width: 2),
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: GestureDetector(
                                    onTap: _sendMessage,
                                    child: Icon(
                                      Icons.send,
                                      color: AppColors.lightColorScheme.primary,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              onSubmitted: (_) => _sendMessage(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messages[index];
                    return MessageBubble(message: message);
                  },
                );
              },
            ),
          ),
          // Input area
          Container(
            color: AppColors.grayLight,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
                controller: _messageController,
                decoration: InputDecoration(
                  hintText: 'Escreva alguma coisa...',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(179, 0, 0, 0),
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColors.lightColorScheme.primary, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
                      onTap: _sendMessage,
                      child: Icon(
                        Icons.send,
                        color: AppColors.lightColorScheme.primary,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
          ],
        ),
        ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 0),
    );
  }
}