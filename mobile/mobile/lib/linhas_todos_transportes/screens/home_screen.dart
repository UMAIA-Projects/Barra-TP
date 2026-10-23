import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/data.dart';
import '../widgets/metro_line_tile.dart';
import '../widgets/bus_route_tile.dart';
import '../../common/navigation_bar.dart';
import '../../common/header_app.dart';
import '../../common/linhas_navigation_helper.dart';
import '../../alertas/flutter_constants_colors.dart' as AlertColors;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedTab = 'todos';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Responsive max width for web
    final isMobile = MediaQuery.of(context).size.width < 500;
    final maxWidth = isMobile ? double.infinity : 500.0;

    return Scaffold(
      body: Center(
        child: Container(
          width: maxWidth,
          color: BarraTPColors.background,
          child: Column(
            children: [
              // Header
              const HeaderApp(),
              // Search Bar
              _buildSearchBar(),
              // Navigation Tabs
              _buildNavigationTabs(),
              // Main Content
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        // Metro do Porto Section
                        _buildMetroSection(),
                        const SizedBox(height: 12),
                        // Divider
                        Divider(
                          color: BarraTPColors.mediumGray,
                          thickness: 2,
                          indent: 16,
                          endIndent: 16,
                        ),
                        const SizedBox(height: 12),
                        // Metro do Porto - Autocarro
                        _buildAutocarroSection(),
                        const SizedBox(height: 12),
                        // Divider
                        Divider(
                          color: BarraTPColors.mediumGray,
                          thickness: 2,
                          indent: 16,
                          endIndent: 16,
                        ),
                        const SizedBox(height: 12),
                        // STCP Bus Routes
                        _buildBusRoutesSection(),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(
        currentIndex: 2,
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: BarraTPColors.lightGray,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        decoration: const InputDecoration(
          hintText: 'Pesquisar linha...',
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _buildNavigationTabs() {
    final List<String> tabs = ['Favoritos', 'Todos', 'Autocarro', 'Comboio', 'Metro'];
    
    return Container(
      color: AlertColors.AppColors.tealdark,
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return GestureDetector(
              onTap: () {
                LinhasNavigationHelper.navigateToTab(context, 'alertas');
              },
              child: Container(
                width: 48,
                alignment: Alignment.center,
                child: const Icon(Icons.notifications, color: Colors.white),
              ),
            );
          }
          final tabName = tabs[index - 1];
          final isActive = _selectedTab == tabName.toLowerCase();
          return GestureDetector(
            onTap: () {
              if (tabName.toLowerCase() == 'todos') {
                setState(() => _selectedTab = 'todos');
              } else {
                LinhasNavigationHelper.navigateToTab(context, tabName.toLowerCase());
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Center(
                child: Text(
                  tabName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMetroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Container(
          color: BarraTPColors.mediumGray,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Metro do Porto',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: BarraTPColors.teal,
                ),
              ),
              Icon(
                Icons.subway,
                color: BarraTPColors.teal,
                size: 24,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Metro lines
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: metroLines
                .map((line) => MetroLineTile(line: line))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildAutocarroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Container(
          color: BarraTPColors.mediumGray,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Metro do Porto - Autocarro',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: BarraTPColors.teal,
                ),
              ),
              Icon(
                Icons.directions_bus,
                color: BarraTPColors.teal,
                size: 24,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Image.network(
                'https://api.builder.io/api/v1/image/assets/TEMP/e98433a99341411517fdc418c6c7e5e436abeeff?width=50',
                width: 24,
                height: 24,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.directions_bus,
                    color: BarraTPColors.teal,
                    size: 24,
                  );
                },
              ),
              const SizedBox(width: 12),
              const Text(
                'Transportes Alternativos da Trofa',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: BarraTPColors.teal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBusRoutesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Container(
          color: BarraTPColors.mediumGray,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'STCP - Sociedade Transportes Coletivos do Porto',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: BarraTPColors.teal,
                  ),
                ),
              ),
              Icon(
                Icons.directions_bus,
                color: BarraTPColors.teal,
                size: 24,
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Bus routes
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: busRoutes
                .map((route) => BusRouteTile(route: route))
                .toList(),
          ),
        ),
      ],
    );
  }
}
