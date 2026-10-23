import 'package:flutter/material.dart' hide SearchBar;
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../models/metro_line.dart';
import '../widgets/top_nav_tabs.dart';
import '../widgets/metro_line_card.dart';
import '../widgets/search_bar.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentBottomNavIndex = 0;

  final List<MetroLine> metroLines = [
    MetroLine(
      id: 'A',
      label: 'A',
      name: 'Linha Azul',
      color: AppColors.lineBlue,
    ),
    MetroLine(
      id: 'B',
      label: 'B',
      name: 'Linha Vermelha',
      color: AppColors.lineRed,
    ),
    MetroLine(
      id: 'Bx',
      label: 'Bx',
      name: 'Linha Vermelha (Expresso)',
      color: AppColors.lineRed,
    ),
    MetroLine(
      id: 'C',
      label: 'C',
      name: 'Linha Verde',
      color: AppColors.lineGreen,
    ),
    MetroLine(
      id: 'D',
      label: 'D',
      name: 'Linha Amarela',
      color: AppColors.lineYellow,
    ),
    MetroLine(
      id: 'E',
      label: 'E',
      name: 'Linha Violeta',
      color: AppColors.linePurple,
    ),
    MetroLine(
      id: 'F',
      label: 'F',
      name: 'Linha Laranja',
      color: AppColors.lineOrange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HeaderApp(),
            // Search Bar (alertas style)
            Container(
              color: const Color(0xFFE6E6E6),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Pesquisar linha...',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const TopNavTabs(),
            Expanded(
              child: Container(
                color: AppColors.background,
                child: _buildContentArea(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: !isMobile
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomBottomBar(currentIndex: 2),
              ],
            ),
    );
  }

  Widget _buildContentArea() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Metro do Porto header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.metroHeaderBackground,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Metro do Porto',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.directions_subway, // ÍCONE DE METRO AQUI
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Metro lines list
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: metroLines.length,
              itemBuilder: (context, index) {
                return MetroLineCard(
                  line: metroLines[index],
                  showDivider: index < metroLines.length - 1,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}