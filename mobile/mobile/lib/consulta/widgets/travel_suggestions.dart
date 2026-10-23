import 'package:flutter/material.dart';
import 'promo_card.dart';
import '../../ver_todos_daConsulta/screens/home_screen.dart' as ver_todos;

class TravelSuggestions extends StatelessWidget {
  const TravelSuggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 480),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            height: 2,
            width: double.infinity,
            color: const Color(0xFF475569),
          ),
          const SizedBox(height: 44),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Sugestões de viagem\n',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 22,
                                color: Color(0xFF365F67),
                                height: 1.2,
                              ),
                            ),
                            TextSpan(
                              text: 'Melhores ofertas do mês',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF475569),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      const Padding(
                        padding: EdgeInsets.only(left: 14),
                        child: Text(
                          'Descontos',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF475569),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // TEXTO "ver todos" como botão clicável
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ver_todos.HomeScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'ver todos',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF475569),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: PromoCard(),
          ),
        ],
      ),
    );
  }
}