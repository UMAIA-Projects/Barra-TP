import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/station_model.dart';
import '../providers/navigation_provider.dart';
import '../widgets/search_bar.dart' as custom_search;
import '../widgets/station_card.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';
import '../../estacoesfav/e_favoritos.dart' as estacoesfav;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Station> stations;

  @override
  void initState() {
    super.initState();
    stations = getMockStations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Header
            const HeaderApp(),
            
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Search Bar
                    const custom_search.CustomSearchBar(),
                    
                    // Map Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: Container(
                        height: 325,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            // Map image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                'https://api.builder.io/api/v1/image/assets/TEMP/598888e7762bc64c7e4d82648d8b7e0cd4f84ebc?width=844',
                                width: double.infinity,
                                height: 325,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: Icon(Icons.map, size: 50, color: Colors.grey),
                                    ),
                                  );
                                },
                              ),
                            ),
                            // Current location marker
                            const Positioned(
                              left: 154,
                              top: 123,
                              child: Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 28,
                              ),
                            ),
                            // Fullscreen button
                            Positioned(
                              right: 8,
                              bottom: 8,
                              child: GestureDetector(
                                onTap: () {
                                  // Handle fullscreen
                                },
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(
                                    Icons.fullscreen,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    // Tabs
                    _buildTabBar(context),
                    
                    // Stations List
                    Consumer<NavigationProvider>(
                      builder: (context, nav, _) {
                        if (nav.activeTab == 'stations') {
                          return Column(
                            children: [
                              for (var station in stations)
                                StationCard(station: station),
                            ],
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              'Sem favoritos adicionados',
                              style: const TextStyle(
                                color: Color(0xFF365F67),
                                fontSize: 14,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    
                    // Bottom spacing for navigation bar
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 1),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, nav, _) {
        return Container(
          height: 48,
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => nav.setActiveTab('stations'),
                  child: Container(
                    decoration: BoxDecoration(
                      color: nav.activeTab == 'stations'
                          ? const Color(0xFF365F67)
                          : const Color(0xFF407079),
                    ),
                    child: Center(
                      child: Text(
                        'Estações mais próximas',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const estacoesfav.EFavoritos(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: nav.activeTab == 'estacoesfav'
                          ? const Color(0xFF365F67)
                          : const Color(0xFF407079),
                    ),
                    child: Center(
                      child: Text(
                        'Favoritos',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}