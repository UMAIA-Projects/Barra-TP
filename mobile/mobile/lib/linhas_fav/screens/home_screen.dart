import 'package:flutter/material.dart';
import '../widgets/custom_widgets.dart' hide SearchBar;
import '../constants/app_colors.dart';
import '../models/transport_models.dart';
import '../../common/navigation_bar.dart' show CustomBottomBar;
import '../../common/header_app.dart';
import '../../common/linhas_navigation_helper.dart';
import '../../alertas/flutter_constants_colors.dart' as AlertColors;
import '../../linhas_autocarro/screens/home_screen.dart' as AutocarroScreen;
import '../../linhas_todos_transportes/screens/home_screen.dart' as TodosScreen;
import '../../linhas_comboio/screens/home_screen.dart' as ComboioScreen;
import '../../linhas_metro/screens/home_screen.dart' as MetroScreen;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedTab = 'favoritos';
  int selectedNavIndex = 0;
  String searchQuery = '';

  // Sample data for metro stations
  final List<MetroStation> metroStations = [
    MetroStation(
      name: 'ISMAI',
      icon:
          'https://api.builder.io/api/v1/image/assets/TEMP/026d178edcb3772598e6b7b1caa1f147de75587e?width=62',
      routes: [
        MetroRoute(
          line: 'C',
          name: 'Campanhã',
          time: '30min',
          detail: '50, 16:15',
        ),
      ],
    ),
    MetroStation(
      name: 'Casa da Música',
      icon:
          'https://api.builder.io/api/v1/image/assets/TEMP/abfb44f60ec378bd994f2c62d1c494b5c2046512?width=62',
      routes: [
        MetroRoute(
          line: 'C',
          name: 'Campanhã',
          time: 'A Chegar',
          detail: '42, 16:02',
        ),
        MetroRoute(
          line: 'C',
          name: 'ISMAI',
          time: '9 min',
          detail: '22, 15:45',
        ),
        MetroRoute(
          line: 'C',
          name: 'Fórum Maia',
          time: '28 min',
          detail: '50, 16:05',
        ),
      ],
    ),
    MetroStation(
      name: 'Fórum Maia',
      icon:
          'https://api.builder.io/api/v1/image/assets/TEMP/add41ddb6259e14b3defdf78069726c05202ed19?width=62',
      routes: [
        MetroRoute(
          line: 'C',
          name: 'Campanhã',
          time: '3min',
          detail: '17, 15:35',
        ),
        MetroRoute(
          line: 'C',
          name: 'ISMAI',
          time: '16min',
          detail: '28, 15:42',
        ),
      ],
    ),
  ];

  // Sample data for bus routes
  final List<BusRoute> busRoutes = [
    BusRoute(
      number: '203',
      color: 'cyan',
      from: 'Marquês',
      to: 'Castelo do Queijo',
    ),
    BusRoute(
      number: '604',
      color: 'green',
      from: 'Hospital São João',
      to: 'Aeroporto',
    ),
  ];

  // Sample data for train routes
  final List<TrainRoute> trainRoutes = [
    TrainRoute(
      code: 'AP',
      color: 'green',
      name: 'Linha do Norte',
      isOutline: false,
    ),
    TrainRoute(
      code: 'R',
      color: 'white',
      name: 'Marco de Canaveses - Porto Campanhã',
      isOutline: true,
    ),
  ];

  void _navigateToTab(String tab) {
    if (tab == selectedTab) return;
    
    switch (tab) {
      case 'favoritos':
        // Already on favoritos page
        break;
      case 'todos':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const TodosScreen.HomeScreen()),
        );
        break;
      case 'autocarro':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AutocarroScreen.HomeScreen()),
        );
        break;
      case 'comboio':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ComboioScreen.HomeScreen()),
        );
        break;
      case 'metro':
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MetroScreen.HomeScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ['Favoritos', 'Todos', 'Autocarro', 'Comboio', 'Metro'];
    
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(), // Add drawer if needed
      body: Column(
        children: [
          const HeaderApp(),
          // Search Bar (alertas style)
          Container(
            color: AlertColors.AppColors.lightGray,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: const InputDecoration(
                hintText: 'Pesquisar linha...',
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Tabs Bar (alertas style)
          Container(
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
                final isActive = selectedTab == tabName.toLowerCase();
                return GestureDetector(
                  onTap: () {
                    if (tabName.toLowerCase() == 'favoritos') {
                      setState(() => selectedTab = 'favoritos');
                    } else {
                      _navigateToTab(tabName.toLowerCase());
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
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Metro Section
                  SectionHeader(
                    title: 'Linhas e Estações Favoritas - Metropolitano',
                  ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ...metroStations.map((station) {
                              final index =
                                  metroStations.indexOf(station);
                              return Column(
                                children: [
                                  MetroStationCard(station: station),
                                  if (index < metroStations.length - 1)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Container(
                                        height: 2,
                                        color: AppColors.gray,
                                      ),
                                    ),
                                ],
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Favorite Lines Section
                      SectionHeader(
                        title: 'Linhas Favoritas',
                        showIcons: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Bus Section
                            const SubsectionHeader(title: 'Autocarros'),
                            ...busRoutes.map((route) {
                              final index = busRoutes.indexOf(route);
                              return Column(
                                children: [
                                  BusRouteCard(route: route),
                                  if (index < busRoutes.length - 1)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Container(
                                        height: 1,
                                        color: AppColors.gray,
                                      ),
                                    ),
                                ],
                              );
                            }).toList(),
                            const SizedBox(height: 16),
                            Container(
                              height: 1,
                              color: AppColors.gray,
                            ),
                            const SizedBox(height: 16),
                            // Train Section
                            const SubsectionHeader(title: 'Comboios'),
                            ...trainRoutes.map((route) {
                              final index = trainRoutes.indexOf(route);
                              return Column(
                                children: [
                                  TrainRouteCard(route: route),
                                  if (index < trainRoutes.length - 1)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: Container(
                                        height: 1,
                                        color: AppColors.gray,
                                      ),
                                    ),
                                ],
                              );
                            }).toList(),
                            const SizedBox(height: 100),
                          ],
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 0),
    );
  }
}
