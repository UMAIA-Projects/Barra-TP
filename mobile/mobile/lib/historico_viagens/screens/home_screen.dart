import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/trip_model.dart';
import '../providers/trip_provider.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/trip_card.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';
import '../../area_priv/screens/home_screen.dart' as AreaPriv;
import '../../historico_multas/screens/home_screen.dart' as HistoricoMultasScreen;
import '../../historico_multas/providers/fine_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final maxWidth = Responsive.getMaxWidth(context);

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: maxWidth,
          child: Column(
            children: [
              // Common Header
              const HeaderApp(),
              // Breadcrumb/Return bar
              Container(
                height: 48,
                color: AppTheme.secondaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AreaPriv.HomeScreen(),
                          ),
                        );
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 32,
                      height: 22,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 4,
                            color: Color.fromARGB(64, 0, 0, 0),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.person, color: AppTheme.primaryColor, size: 20),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Área Privada',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NunitoSans',
                      ),
                    ),
                  ],
                ),
              ),
              // Section divider
              Container(
                height: 48,
                color: AppTheme.secondaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 19, vertical: 8),
                      child: Text(
                        'Histórico e Multas',
                        style: GoogleFonts.daysOne(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ),
              // Tab buttons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Consumer<TripProvider>(
                  builder: (context, provider, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildTabButton(
                          label: 'Viagens',
                          isActive: provider.activeTab == 'viagens',
                          onPressed: () =>
                              provider.setActiveTab('viagens'),
                        ),
                        const SizedBox(width: 76),
                        _buildTabButton(
                          label: 'Multas',
                          isActive: provider.activeTab == 'multas',
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ChangeNotifierProvider(
                                  create: (_) => FineProvider(),
                                  child: const HistoricoMultasScreen.HomeScreen(),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Trips list
              Expanded(
                child: Consumer<TripProvider>(
                  builder: (context, provider, _) {
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      itemCount: provider.trips.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 24),
                      itemBuilder: (context, index) {
                        return TripCard(trip: provider.trips[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 3),
    );
  }

  Widget _buildTabButton({
    required String label,
    required bool isActive,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        elevation: 4,
      ),
      child: Text(
        label,
        style: GoogleFonts.nunitoSans(
          fontSize: 15,
          fontWeight: FontWeight.w800,
          color: Colors.white.withOpacity(isActive ? 1.0 : 0.5),
        ),
      ),
    );
  }
}
