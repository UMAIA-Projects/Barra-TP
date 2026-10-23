import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/constants/responsive_utils.dart';

import '../widgets/news_section.dart';
import '../widgets/passes_info.dart';

class SaberMaisScreen extends StatelessWidget {
  const SaberMaisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return BaseScreen(
      activePage: 'Saber Mais',
      showSearchBar: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.spacing(40),
          vertical: responsive.spacing(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CONTEÚDO CENTRAL
            Expanded(
              flex: 65,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
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
                padding: const EdgeInsets.all(40),
                child: _MainContent(),
              ),
            ),
            SizedBox(width: responsive.spacing(40)),
            // SIDEBAR DIREITA
            Expanded(
              flex: 35,
              child: _RightSidebar(),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Como funciona o nosso site",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.slate700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 2,
          width: double.infinity,
          color: AppColors.slate700,
        ),
        const SizedBox(height: 32),
        const Text(
          "Obrigado por utilizar o nosso website! Não se esqueça de verificar a nossa aplicação.\n\n"
          "O Barra TP facilita a vida de quem precisa ou quer viajar. Oferecemos todas as informações "
          "para não ter que se preocupar.\n\n"
          "Disponibilizamos planeamento e compra de viagens, consulta de horários e linhas, "
          "aluguer de automóveis e muito mais.",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.slate700,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 48),
        const Text(
          "Passes",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.slate700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 2,
          width: double.infinity,
          color: AppColors.slate700,
        ),
        const SizedBox(height: 32),
        const PassesInfo(),
      ],
    );
  }
}

class _RightSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const NewsSection();
  }
}