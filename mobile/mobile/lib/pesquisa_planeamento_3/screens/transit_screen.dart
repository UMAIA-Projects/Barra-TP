import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/route.dart';
import '../providers/route_provider.dart';
import '../models/transport_mode.dart';
import '../widgets/location_input.dart';
import '../widgets/transport_mode_selector.dart';
import '../../common/navigation_bar.dart';
import '../theme/app_theme.dart';
import '../../pesquisa_planeamento_1/main.dart' as p1;
import '../../pesquisa_planeamento_2/main.dart' as p2;
import '../../pesquisa_planeamento_4/main.dart' as p4;
import '../../consulta/screens/consulta.dart';
import '../../planeamento_1/main.dart' as planeamento1;

class TransitScreen extends StatefulWidget {
  const TransitScreen({Key? key}) : super(key: key);

  @override
  State<TransitScreen> createState() => _TransitScreenState();
}

class _TransitScreenState extends State<TransitScreen> {
  int _currentNavIndex = 0;

  @override
void initState() {
  super.initState();
  
  // Adia a execução até depois que o primeiro frame for renderizado
  WidgetsBinding.instance.addPostFrameCallback((_) {
    _initializeDefaultRoute();
  });
}

void _initializeDefaultRoute() {
  final provider = context.read<RoutePlanningProvider>();
  if (provider.origin == null) {
    provider.setOrigin(
      const RouteStop(
        id: '1',
        name: 'Mandim',
        latitude: 41.1627,
        longitude: -8.6025,
        type: 'origin',
      ),
    );
  }
  if (provider.destination == null) {
    provider.setDestination(
      const RouteStop(
        id: '2',
        name: 'Universidade da Maia - UMaia',
        latitude: 41.1889,
        longitude: -8.6281,
        type: 'destination',
      ),
    );
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
              child: Consumer<RoutePlanningProvider>(
                builder: (context, provider, _) {
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
                                    value: provider.origin?.name,
                                    iconType: 'origin',
                                    onTap: () => _showLocationPicker(context, 'origin'),
                                  ),
                                  const SizedBox(height: 8),
                                  LocationInput(
                                    label: 'Destino',
                                    placeholder: 'Selecione destino',
                                    value: provider.destination?.name,
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
                                  onPressed: () => provider.swapLocations(),
                                  tooltip: 'Trocar localizações',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Transport Mode Selector
                        TransportModeSelector(
                          selectedMode: provider.selectedMode,
                          onModeSelected: (mode) {
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const p2.PesquisaPlaneamento2App(),
                                  ),
                                );
                                break;
                              case TransportModeType.walk:
                                // Terceiro botão - já está em pesquisa_planeamento_3
                                provider.setSelectedMode(mode);
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
                        // Route Details
                        Container(
                          color: AppColors.surface,
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
                                    color: AppColors.transitGray,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              // Trip Options
                              _buildTripOptions(context, provider),
                              const SizedBox(height: 16),
                              // Duration
                              if (provider.currentRoute != null)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${provider.currentRoute!.estimatedDuration} min',
                                          style: GoogleFonts.nunitoSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.textPrimary,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '(${provider.currentRoute!.distance.toStringAsFixed(1)} km)',
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
                                    ..._buildRouteSteps(context, provider),
                                  ],
                                ),
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
        currentIndex: _currentNavIndex,
        onTabSelectedOverride: (index) => setState(() => _currentNavIndex = index),
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
        backgroundColor: AppColors.transitTealDark,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: AppColors.transitTeal),
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

  Widget _buildTripOptions(BuildContext context, RoutePlanningProvider provider) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildTripOptionButton(
          context,
          'Partida às 18:04',
          Icons.arrow_drop_down,
        ),
        GestureDetector(
          onTap: () => provider.setAvoidTolls(!provider.avoidTolls),
          child: _buildTripOptionButton(
            context,
            'Evitar portagens',
            Icons.check,
            isActive: provider.avoidTolls,
          ),
        ),
        _buildTripOptionButton(
          context,
          'Evitar autoestradas',
          null,
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
        color: isActive ? AppColors.transitGray : AppColors.grayMedium,
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
                color: AppColors.textPrimary,
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

  List<Widget> _buildRouteSteps(BuildContext context, RoutePlanningProvider provider) {
    if (provider.currentRoute == null) return [];

    return provider.currentRoute!.steps.map((step) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Icon(
                step.direction == 'location' ? Icons.location_on : Icons.arrow_upward,
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
                  if (step.distance != null)
                    Text(
                      step.distance!,
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