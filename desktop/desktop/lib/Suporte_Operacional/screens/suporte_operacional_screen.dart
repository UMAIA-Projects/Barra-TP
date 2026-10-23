import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/sidebar_navigation.dart';
import 'package:desktop/constants/footer.dart';
import 'package:desktop/constants/user_info_card.dart';
import 'package:desktop/constants/action_button.dart';

import '../widgets/contact_content.dart';
import '../widgets/outros_contactos.dart';

class SuporteOperacionalScreen extends StatelessWidget {
  const SuporteOperacionalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SIDEBAR ESQUERDA (FIXA NO TOPO)
              const SizedBox(
                width: 320,
                child: SidebarNavigation(activePage: 'Suporte'),
              ),

              // CONTEÚDO PRINCIPAL
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(40, 220, 40, 120),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // CONTEÚDO CENTRAL
                      ContactContent(),

                      SizedBox(width: 40),

                      // SIDEBAR DIREITA
                      OutrosContactos(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // FOOTER FIXO
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Footer(),
          ),

          // USER INFO FIXO
          const Positioned(
            top: 0,
            right: 0,
            child: UserInfoCard(),
          ),

          // BOTÕES FIXOS
          Positioned(
            top: 100,
            right: 15,
            child: Row(
              children: const [
                const ActionButtonWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}