import 'package:flutter/material.dart';
import '../widgets/price_card.dart';
import '../widgets/route_card.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';
import '../../descontos_disponiveis/constants/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavIndex = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Common Header
          const HeaderApp(),

          // Tabbar com botão de retornar (igual à DiscountsScreen)
          _buildTabBar(),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 480),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.brandTeal),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    // Primeiro RouteCard (com fundo branco)
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
                            TextSpan(text: ' para '),
                            TextSpan(
                              text: 'Porto (Exponor)',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // PriceCard (sem fundo branco)
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
                            TextSpan(text: ' para '),
                            TextSpan(
                              text: 'Braga',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // RouteCard complexo com overlay e logo
                    RouteCard(
                      backgroundImage: 'https://api.builder.io/api/v1/image/assets/TEMP/051d51d1d0bf6a4a998db33423915d82d9245776?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                      price: 'Desde 4,99 €',
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
                            TextSpan(text: ' para '),
                            TextSpan(
                              text: 'Lisboa (Oriente)',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                      overlayImage: 'https://api.builder.io/api/v1/image/assets/TEMP/300da50f45572cb3e9c0c1b29ec35ffadfba28cb?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                      logoImage: 'https://api.builder.io/api/v1/image/assets/TEMP/5bbe21610522f97cbb023c9076e07d5bebf70b33?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                      hasComplexBackground: true,
                    ),

                    const SizedBox(height: 24),

                    // RouteCard (com fundo branco)
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
                              text: 'Porto',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            TextSpan(
                              text: ' (todas as estações)',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            TextSpan(text: ' para '),
                            TextSpan(
                              text: 'Fátima',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // PriceCard (sem fundo branco)
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
                            TextSpan(text: ' para '),
                            TextSpan(
                              text: 'Setúbal',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Último RouteCard complexo
                    RouteCard(
                      backgroundImage: 'https://api.builder.io/api/v1/image/assets/TEMP/92036baa3fa0b77426754363af0aa5ea83bfd65f?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                      price: 'Desde 3,99 €',
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
                              text: 'Fátima',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            TextSpan(text: ' para '),
                            TextSpan(
                              text: 'Lisboa (Oriente)',
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                      overlayImage: 'https://api.builder.io/api/v1/image/assets/TEMP/72cc9335caa0e62e711d185d287d6c92c137f56f?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                      logoImage: 'https://api.builder.io/api/v1/image/assets/TEMP/5bbe21610522f97cbb023c9076e07d5bebf70b33?placeholderIfAbsent=true&apiKey=3157eb5471194c059d64fbf859cdbb1d',
                      hasComplexBackground: true,
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),

          // Bottom Navigation Bar
          CustomBottomBar(
            currentIndex: _selectedNavIndex,
            onTabSelectedOverride: (index) {
              setState(() {
                _selectedNavIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: AppColors.brandTealLight,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          // Ícone de seta para a esquerda
          const Icon(Icons.chevron_left, color: AppColors.white),
          const SizedBox(width: 8),
          // Texto "Retornar"
          const Text(
            'Retornar',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}