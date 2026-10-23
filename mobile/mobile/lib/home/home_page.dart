import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/header_app.dart';
import '../common/navigation_bar.dart';
import '../common/search.dart';
import '../nav/app_drawer.dart';
import '../estacoesfav/e_favoritos.dart';
import '../pesquisa_planeamento_1/screens/home_screen.dart';
import '../pesquisa_planeamento_1/providers/route_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFF475569)),
                ),
                child: Column(
                  children: [
                    const HeaderApp(),
                    
                    // Search Section
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                              create: (_) => RouteProvider(),
                              child: HomeScreen(
                                onNavigate: (index) {
                                  // Função vazia, não é necessário fazer nada aqui
                                  // pois estamos a navegar para uma nova página
                                },
                              ),
                            ),
                          ),
                        );
                      },
                      child: const SearchSection(),
                    ),
                    
                    // Near By Stations Widget
                    _buildNearByStations(context),
                    
                    // Recent Stations Widget
                    _buildRecentStations(),
                    
                    const SizedBox(height: 100), // Espaço para o bottom navigation
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 0),
    );
  }

  Widget _buildNearByStations(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 340),
      margin: const EdgeInsets.only(top: 48, left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xFF475569),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F5),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.only(left: 1, right: 1, bottom: 28),
        child: Column(
          children: [
            // Header
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EFavoritos(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD4D4D8),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Estações mais próximas',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF475569),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.train,
                        color: Color(0xFF365F67),
                        size: 26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // Station card
            Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFA3A3A3).withOpacity(0.4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                left: 10,
                right: 64,
                top: 6,
                bottom: 6,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(
                      Icons.directions_bus,
                      color: Color(0xFF365F67),
                      size: 17,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ISMAI (Metro)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF475569),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Caminhe 2 minutos | 3506 |',
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Bus routes section
            Container(
              constraints: const BoxConstraints(maxWidth: 298),
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side - Routes
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First route
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF93C5FD),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            child: const Text(
                              '3506',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF475569),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Maia (Centro)',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF475569),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      
                      // Second route
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF5EEAD4),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            child: const Text(
                              '6306',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF475569),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Santo Tirso (Estação)',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF475569),
                                ),
                              ),
                              const SizedBox(height: 28),
                              Align(
                                alignment: Alignment.centerRight,
                                child: InkWell(
                                  onTap: () {
                                    print('Ver mais tapped');
                                  },
                                  child: const Text(
                                    'ver + 1',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF475569),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  
                  // Right side - Schedules
                  Column(
                    children: [
                      _buildTimeIndicator('32min'),
                      const Text(
                        '09:19, 10:09',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF475569),
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildTimeIndicator('6min'),
                      const Text(
                        '08:19, 9:09',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentStations() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 340),
      margin: const EdgeInsets.only(top: 64, left: 16, right: 16, bottom: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: const Color(0xFF475569),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF4F4F5),
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          children: [
            // Header
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD4D4D8),
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recentes',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF475569),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.history,
                      color: Color(0xFF365F67),
                      size: 25,
                    ),
                  ),
                ],
              ),
            ),
            
            // Station card
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFA3A3A3).withOpacity(0.4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                left: 6,
                right: 64,
                top: 2,
                bottom: 2,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 31,
                    height: 31,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF10B981),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.train,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ISMAI',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF475569),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Caminhe 5 minutos',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Schedule section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  const Text(
                    'Horários da Estação:',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF475569),
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // First schedule row
                  _buildScheduleRow('C', 'Sentido Campanhã', '17:30', '30min'),
                  
                  const SizedBox(height: 12),
                  
                  // Second schedule row
                  _buildScheduleRow('C', 'Sentido Campanhã', '17:50', '50min'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeIndicator(String time) {
    return Container(
      width: 60,
      height: 20,
      decoration: BoxDecoration(
        color: const Color(0xFFD4D4D8),
        border: Border.all(color: const Color(0xFF475569), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 4, top: 2),
            child: Icon(
              Icons.access_time,
              color: Color(0xFF365F67),
              size: 17,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF475569),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleRow(String line, String direction, String time, String duration) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                width: 31,
                height: 31,
                decoration: BoxDecoration(
                  color: const Color(0xFF65A30D),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    line,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  direction,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF475569),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF475569),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(width: 32),
              Container(
                width: 66,
                height: 26,
                decoration: BoxDecoration(
                  color: const Color(0xFFD4D4D8),
                  border: Border.all(color: const Color(0xFF475569), width: 1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.access_time,
                        color: Color(0xFF365F67),
                        size: 17,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF475569),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}