import 'package:flutter/material.dart' hide SearchBar;
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import '../widgets/action_buttons.dart';
import '../widgets/location_input.dart';
import '../widgets/transport_mode_selector.dart';
import '../models/transport_mode.dart';
import '../widgets/route_details.dart';
import '../../common/navigation_bar.dart';
import '../theme/app_theme.dart';
import '../../pesquisa_planeamento_1/main.dart' as p1;
import '../../pesquisa_planeamento_3/main.dart' as p3;
import '../../pesquisa_planeamento_4/main.dart' as p4;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavIndex = 0;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  TransportModeType _getTransportModeType(String mode) {
    switch (mode) {
      case 'car':
        return TransportModeType.car;
      case 'bus':
        return TransportModeType.bus;
      case 'walk':
        return TransportModeType.walk;
      case 'bike':
        return TransportModeType.bike;
      default:
        return TransportModeType.bus;
    }
  }

  String _getTransportModeString(TransportModeType type) {
    switch (type) {
      case TransportModeType.car:
        return 'car';
      case TransportModeType.bus:
        return 'bus';
      case TransportModeType.walk:
        return 'walk';
      case TransportModeType.bike:
        return 'bike';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: Consumer<RouteProvider>(
                builder: (context, routeProvider, _) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        // Search Bar
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                          child: _buildSearchBar(),
                        ),
                        // Action Buttons
                        const ActionButtons(),
                        const SizedBox(height: 24),
                        // Route Inputs with Swap Button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 44),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  LocationInput(
                                    label: 'Origem',
                                    placeholder: 'Selecione origem',
                                    value: routeProvider.origin,
                                    iconType: 'origin',
                                    onTap: () => _showLocationPicker(context, 'origin'),
                                  ),
                                  const SizedBox(height: 8),
                                  LocationInput(
                                    label: 'Destino',
                                    placeholder: 'Selecione destino',
                                    value: routeProvider.destination,
                                    iconType: 'destination',
                                    onTap: () => _showLocationPicker(context, 'destination'),
                                  ),
                                ],
                              ),
                              Positioned(
                                right: -28,
                                top: 16,
                                child: IconButton(
                                  icon: const Icon(Icons.swap_vert),
                                  color: AppColors.textPrimary,
                                  onPressed: () {
                                    routeProvider.swapLocations();
                                  },
                                  tooltip: 'Trocar localizações',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Transport Mode Selector
                        TransportModeSelector(
                          selectedMode: _getTransportModeType(routeProvider.selectedMode),
                          onModeSelected: (mode) {
                            routeProvider.setSelectedMode(_getTransportModeString(mode));
                            switch (mode) {
                              case TransportModeType.car:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const p1.PesquisaPlaneamento1App(),
                                  ),
                                );
                                break;
                              case TransportModeType.bus:
                                // Segundo botão - já está em pesquisa_planeamento_2
                                break;
                              case TransportModeType.walk:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const p3.PesquisaPlaneamento3App(),
                                  ),
                                );
                                break;
                              case TransportModeType.bike:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const p4.PesquisaPlaneamento4App(),
                                  ),
                                );
                                break;
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        // Map Placeholder
                        Container(
                          height: 300,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.transitTeal),
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.surface,
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.green.shade100,
                                Colors.blue.shade100,
                              ],
                            ),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.network(
                                'https://api.builder.io/api/v1/image/assets/TEMP/1f4948b90f91494bae0418c5e1113c3b9b970e4b?width=876',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Text(
                                      'Map Loading...',
                                      style: GoogleFonts.nunitoSans(
                                        fontSize: 14,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const RouteDetails(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _selectedNavIndex,
        onTabSelectedOverride: (index) {
          setState(() {
            _selectedNavIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      color: AppColors.transitTeal,
      child: Column(
        children: [
          Container(
            height: 58,
            color: AppColors.transitTeal,
          ),
          Container(
            height: 53,
            color: AppColors.transitTeal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.menu,
                      color: Color(0xFFE3E3E3),
                      size: 28,
                    ),
                  ),
                ),
                Text(
                  'BARRA TP',
                  style: GoogleFonts.daysOne(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Pesquisar...',
        filled: true,
        fillColor: AppColors.transitLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.transitTeal),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.transitTeal),
        ),
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(
            Icons.search,
            color: AppColors.textSecondary,
            size: 24,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
    );
  }

  void _showLocationPicker(BuildContext context, String type) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Location picker for $type not yet implemented'),
      ),
    );
  }
}