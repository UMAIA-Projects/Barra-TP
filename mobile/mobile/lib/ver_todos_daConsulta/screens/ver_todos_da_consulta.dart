import 'package:flutter/material.dart';
import '../../common/header_app.dart';
import '../widgets/price_card.dart';
import '../widgets/route_card.dart';
import '../widgets/return_button.dart';
import '../widgets/filter_section.dart';

class VerTodosDaConsulta extends StatelessWidget {
  const VerTodosDaConsulta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 480),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF475569)),
          boxShadow: const [
            BoxShadow(
              color: Color(0x40000000),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              const HeaderApp(),
              const ReturnButton(),
              const FilterSection(),

              RouteCard(
                backgroundImage: 'https://api.builder.io/api/v1/image/assets/TEMP/b943e41b10b2037f59c13ddfc75d2a5dcc1c7991?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                price: 'Desde 6,95 €',
                routeDescription: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(text: 'De '),
                      TextSpan(
                        text: 'Lisboa',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: ' (todas as estações)',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(text: 'Para '),
                      TextSpan(
                        text: 'Porto (Exponor)',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),

              PriceCard(
                backgroundImage: 'https://api.builder.io/api/v1/image/assets/TEMP/2d756b8bf9456dc315545afda8bbe39174c65f3b?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                price: 'Desde 2,49 €',
                routeDescription: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(text: 'De '),
                      TextSpan(
                        text: 'Porto',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: ' (todas as estações)',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(text: 'Para '),
                      TextSpan(
                        text: 'Braga',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),

              // Complex route card with overlay and logo
              Container(
                margin: const EdgeInsets.only(top: 36),
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 370),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x40000000),
                      offset: Offset(4, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 242, // aspect ratio 1.529
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: Image.network(
                                'https://api.builder.io/api/v1/image/assets/TEMP/051d51d1d0bf6a4a998db33423915d82d9245776?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: Image.network(
                                'https://api.builder.io/api/v1/image/assets/TEMP/300da50f45572cb3e9c0c1b29ec35ffadfba28cb?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            right: 24,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.network(
                                  'https://api.builder.io/api/v1/image/assets/TEMP/5bbe21610522f97cbb023c9076e07d5bebf70b33?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                                  width: 118,
                                  height: 14,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF475569),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'Desde 4,99 €',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      decoration: const BoxDecoration(
                        color: Color(0xFF475569),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 5),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(text: 'De '),
                            TextSpan(
                              text: 'Coimbra',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            TextSpan(text: 'Para '),
                            TextSpan(
                              text: 'Lisboa (Oriente)',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              RouteCard(
                backgroundImage: 'https://api.builder.io/api/v1/image/assets/TEMP/b965ff080d8e2b05c055c68f19443fefcdd93adf?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                price: 'Desde 7,89 €',
                routeDescription: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(text: 'De '),
                      TextSpan(
                        text: 'Porto (to',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(
                        text: 'das as estações)',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(text: 'Para'),
                      TextSpan(
                        text: ' Fátima',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),

              PriceCard(
                backgroundImage: 'https://api.builder.io/api/v1/image/assets/TEMP/d9e7c3879e723907bee64b1cf0dfa733cc81a356?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                price: 'Desde 5,85 €',
                routeDescription: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    children: [
                      TextSpan(text: 'De '),
                      TextSpan(
                        text: 'Coimbra',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      TextSpan(text: 'Para '),
                      TextSpan(
                        text: 'Setúbal',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),

              // Final complex route card
              Container(
                margin: const EdgeInsets.only(top: 36),
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 370),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x40000000),
                      offset: Offset(4, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 242, // aspect ratio 1.529
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: Image.network(
                                'https://api.builder.io/api/v1/image/assets/TEMP/92036baa3fa0b77426754363af0aa5ea83bfd65f?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: Image.network(
                                'https://api.builder.io/api/v1/image/assets/TEMP/72cc9335caa0e62e711d185d287d6c92c137f56f?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 16,
                            right: 24,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.network(
                                  'https://api.builder.io/api/v1/image/assets/TEMP/5bbe21610522f97cbb023c9076e07d5bebf70b33?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                                  width: 118,
                                  height: 14,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF475569),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'Desde 3,99 €',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      decoration: const BoxDecoration(
                        color: Color(0xFF475569),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 5),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(text: 'De '),
                            TextSpan(
                              text: 'Fátima',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            TextSpan(text: 'Para '),
                            TextSpan(
                              text: 'Lisboa (Oriente)',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 96), // pb-24 equivalent
            ],
          ),
        ),
      ),
    );
  }
}
