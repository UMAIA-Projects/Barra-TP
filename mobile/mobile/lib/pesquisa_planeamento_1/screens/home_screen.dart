import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/route_provider.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_widgets.dart';
import '../widgets/location_input.dart';
import '../widgets/transport_mode_selector.dart';
import '../models/transport_mode.dart';
import '../../common/navigation_bar.dart';
import '../../pesquisa_planeamento_2/main.dart' as p2;
import '../../pesquisa_planeamento_3/main.dart' as p3;
import '../../pesquisa_planeamento_4/main.dart' as p4;
import '../../consulta/screens/consulta.dart';
import '../../planeamento_1/main.dart' as planeamento1;

class HomeScreen extends StatefulWidget {
  final Function(int) onNavigate;

  const HomeScreen({
    Key? key,
    required this.onNavigate,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        return TransportModeType.car;
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildActionButton('Consulta de bilhetes'),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: _buildActionButton('Fazer planeamento'),
                              ),
                            ],
                          ),
                        ),
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
                                  color: AppColors.tealDark,
                                  onPressed: () => routeProvider.swapOriginDestination(),
                                  tooltip: 'Trocar localizações',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Transport Mode Selector
                        TransportModeSelector(
                          selectedMode: _getTransportModeType(routeProvider.selectedTransportMode),
                          onModeSelected: (mode) {
                            routeProvider.updateTransportMode(_getTransportModeString(mode));
                            switch (mode) {
                              case TransportModeType.car:
                                // Primeiro botão - já está em pesquisa_planeamento_1
                                break;
                              case TransportModeType.bus:
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const p2.PesquisaPlaneamento2App(),
                                  ),
                                );
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
                            border: Border.all(color: AppColors.tealDark),
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.grayLight,
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
                                routeProvider.currentRoute.mapImageUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Text(
                                      'Map Loading...',
                                      style: GoogleFonts.nunitoSans(
                                        fontSize: 14,
                                        color: AppColors.grayDark,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),

                        // Route Details
                        Container(
                          color: AppColors.grayLight,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Drag Handle
                              Center(
                                child: Container(
                                  width: 52,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.grayDark,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Trip Options
                              _buildTripOptions(context, routeProvider),
                              const SizedBox(height: 16),
                              // Duration
                              Row(
                                children: [
                                  Text(
                                    '${routeProvider.currentRoute.duration} min',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '(${routeProvider.currentRoute.distance} km)',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w200,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              const Divider(
                                color: AppColors.grayMedium,
                                height: 2,
                              ),
                              const SizedBox(height: 12),
                              // Route Steps
                              Text(
                                'Caminho',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 12),
                              ..._buildRouteSteps(context, routeProvider),
                            ],
                          ),
                        ),
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
        currentIndex: 0,
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      color: AppColors.tealDark,
      child: Column(
        children: [
          Container(
            height: 58,
            color: AppColors.tealDark,
          ),
          Container(
            height: 53,
            color: AppColors.tealDark,
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
        fillColor: AppColors.grayLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.tealDark),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.tealDark),
        ),
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(
            Icons.search,
            color: AppColors.grayDark,
            size: 24,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
    );
  }

  Widget _buildActionButton(String label) {
    return ElevatedButton(
      onPressed: () {
        if (label == 'Consulta de bilhetes') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Consulta(),
            ),
          );
        } else if (label == 'Fazer planeamento') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const planeamento1.BarraTPApp(),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.tealLight,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: AppColors.tealDark),
        ),
        elevation: 4,
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: GoogleFonts.nunitoSans(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildTripOptions(BuildContext context, RouteProvider provider) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildTripOptionButton(
          context,
          'Partida às ${provider.departureTime}',
          Icons.arrow_drop_down,
        ),
        GestureDetector(
          onTap: () => provider.toggleAvoidTolls(),
          child: _buildTripOptionButton(
            context,
            'Evitar portagens',
            Icons.check,
            isActive: provider.avoidTolls,
          ),
        ),
        GestureDetector(
          onTap: () => provider.toggleAvoidHighways(),
          child: _buildTripOptionButton(
            context,
            'Evitar autoestradas',
            null,
            isActive: provider.avoidHighways,
          ),
        ),
      ],
    );
  }

  Widget _buildTripOptionButton(
    BuildContext context,
    String label,
    IconData? icon, {
    bool isActive = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isActive ? AppColors.grayDark : AppColors.grayMedium,
        border: Border.all(color: Colors.black54),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                icon,
                size: icon == Icons.check ? 10 : 16,
                color: AppColors.tealDark,
              ),
            ),
          Text(
            label,
            style: GoogleFonts.nunitoSans(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRouteSteps(BuildContext context, RouteProvider provider) {
    return provider.currentRoute.steps.map((step) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Icon(
                Icons.location_on,
                size: 16,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    step.instruction,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${step.distance.toStringAsFixed(0)} m',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w200,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  void _showLocationPicker(BuildContext context, String type) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Location picker for $type not yet implemented'),
      ),
    );
  }
}