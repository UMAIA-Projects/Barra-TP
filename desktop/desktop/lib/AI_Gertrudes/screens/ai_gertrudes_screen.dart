import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/sidebar_navigation.dart';
import 'package:desktop/constants/footer.dart';
import 'package:desktop/constants/user_info_card.dart';
import 'package:desktop/constants/action_button.dart';
import 'package:desktop/AI_Gertrudes/widgets/chat_interface.dart';
import 'package:desktop/AI_Gertrudes/widgets/questions_sidebar.dart';

class AiGertrudesScreen extends StatelessWidget {
  const AiGertrudesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          Row(
            children: [
              // Sidebar
              Container(
                width: 320,
                color: Colors.transparent,
                child: const SizedBox.expand(
                  child: SidebarNavigation(),
                ),
              ),
              // Área de conteúdo principal
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(40, 180, 40, 100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Chat Interface com borda azul (alinhado mais acima)
                      Expanded(
                        flex: 65,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                offset: const Offset(0, 2),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: ChatInterface(),
                        ),
                      ),
                      const SizedBox(width: 40),
                      // Sidebar direita com Perguntas Automáticas (com padding no topo)
                      Expanded(
                        flex: 35,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: QuestionsSidebar(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Footer fixo
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: const Footer(),
          ),
          // User Info Card fixo
          Positioned(
            top: 0,
            right: 0,
            child: UserInfoCard(),
          ),
          // Botões fixos
          Positioned(
            top: 100,
            right: 15,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ActionButtonWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}