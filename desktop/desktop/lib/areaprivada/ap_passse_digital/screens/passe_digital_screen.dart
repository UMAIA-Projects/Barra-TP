import 'package:flutter/material.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/areaprivada/areaprivada_1/widgets/sidebar_navigation_ap.dart';
import 'package:desktop/areaprivada/ap_passse_digital/widgets/buy_pass_card.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/fonts.dart';
import 'package:desktop/areaprivada/ap_carregar_passe/screens/carregar_passe_screen.dart';

class PasseDigitalScreen extends StatelessWidget {
  const PasseDigitalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      activePage: 'Passe Digital',
      showSearchBar: false,
      customSidebar: SidebarNavigationAP(activePage: 'Passe Digital'),
      child: const MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        top: 0,
        bottom: 40,
      ),
      child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.transparent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                          'Passe Digital',
                          style: AppFonts.titleStyle,
                        ),
                        const SizedBox(height: 16),
                        Divider(
                          color: AppColors.barraTeal,
                          thickness: 4,
                          height: 16,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Desfrute das vantagens do seu passe digital em quase todas as viagens.',
                          style: AppFonts.bodyStyle.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Passe atual: Passe Animália',
                          style: AppFonts.bodyStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Não se esqueça de carregar o passe o passe mensalmente.',
                          style: AppFonts.bodyStyle,
                        ),
                        const SizedBox(height: 24),
                        Center(
                          child: Image.network(
                            'https://api.builder.io/api/v1/image/assets/TEMP/ac2b9ab660710a460860bc6a5845ce3a67a2fd72?width=594',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Divider(
                          color: AppColors.barraTeal,
                          thickness: 4,
                          height: 16,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Carregue o seu passe',
                          style: AppFonts.bodyStyle.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Garanta que nunca falhe uma viagem, carregue até 500 euros imediatamente e abilite-se a ganhar grandes prémios. Desfrute de uma viagem sem se preocupar com os os seus respetivos bilhetes\n\nCarregamentos mínimos: 5€\n\nAo carregar valores adicionais pode ter direito a promoções excecionais. Estamos a fazer um sorteio! 1 pessoa que carregar mais que 5 € pode ganhar até 50.000€ em viagens com o BARRA TP.',
                          style: AppFonts.bodyStyle,
                        ),
                        const SizedBox(height: 24),
                        Divider(
                          color: AppColors.barraTeal,
                          thickness: 4,
                          height: 16,
                        ),
                        const SizedBox(height: 24),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const CarregarPasseScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppFonts.primaryColor,
                            ),
                            child: Text(
                              'Carregar Passe',
                              style: AppFonts.buttonStyle,
                            ),
                          ),
                        ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(24),
                      child: const BuyPassCard(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
