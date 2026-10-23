import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/theme.dart';
import '../widgets/location_input.dart';
import '../widgets/transport_mode_selector.dart';
import '../models/transport_mode.dart';
import '../../pesquisa_planeamento_1/main.dart' as p1;
import '../../pesquisa_planeamento_2/main.dart' as p2;
import '../../pesquisa_planeamento_3/main.dart' as p3;
import '../../consulta/screens/consulta.dart';
import '../../planeamento_1/main.dart' as planeamento1;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController;
  late TextEditingController _originController;
  late TextEditingController _destinationController;
  TransportModeType _selectedMode = TransportModeType.bike;
  bool _avoidTolls = true;
  bool _avoidHighways = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _originController = TextEditingController(text: 'Mandim');
    _destinationController = TextEditingController(text: 'Universidade da Maia - UMaia');
  }

  @override
  void dispose() {
    _searchController.dispose();
    _originController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  void _swapLocations() {
    final temp = _originController.text;
    _originController.text = _destinationController.text;
    _destinationController.text = temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                      child: _buildSearchBar(),
                    ),
                    // Action Buttons
                    _buildActionButtons(),
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
                                value: _originController.text,
                                iconType: 'origin',
                                onTap: () => _showLocationPicker(context, 'origin'),
                              ),
                              const SizedBox(height: 8),
                              LocationInput(
                                label: 'Destino',
                                placeholder: 'Selecione destino',
                                value: _destinationController.text,
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
                              color: Color(0xFF365F67),
                              onPressed: _swapLocations,
                              tooltip: 'Trocar localizações',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Transport Mode Selector
                    TransportModeSelector(
                      selectedMode: _selectedMode,
                      onModeSelected: (mode) {
                        setState(() {
                          _selectedMode = mode;
                        });
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const p3.PesquisaPlaneamento3App(),
                              ),
                            );
                            break;
                          case TransportModeType.bike:
                            // Quarto botão - já está em pesquisa_planeamento_4
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
                        border: Border.all(color: Color(0xFF365F67)),
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFFF4F4F4),
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
                            'https://api.builder.io/api/v1/image/assets/TEMP/2004cd3095c2ff379587e2fedad037b132d76705?width=874',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Text(
                                  'Map Loading...',
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 14,
                                    color: Color(0xFFACA9A9),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    // Route Details
                    _buildRouteDetails(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      color: AppColors.teakDark,
      child: Column(
        children: [
          Container(
            height: 58,
            color: AppColors.teakDark,
          ),
          Container(
            height: 53,
            color: AppColors.teakDark,
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
        fillColor: Color(0xFFEEEEEE),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Color(0xFF365F67)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Color(0xFF365F67)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Color(0xFF365F67), width: 2),
        ),
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(
            Icons.search,
            color: Color(0xFFACA9A9),
            size: 24,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        hintStyle: GoogleFonts.nunitoSans(
          color: Color(0xFFACA9A9),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(child: _buildActionButton('Consulta de bilhetes')),
          const SizedBox(width: 16),
          Expanded(child: _buildActionButton('Fazer planeamento')),
        ],
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
        backgroundColor: AppColors.teakMedium,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: AppColors.teakDark),
        ),
        elevation: 4,
      ),
      child: Text(
        label,
        style: GoogleFonts.nunitoSans(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
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

  Widget _buildRouteDetails() {
    return Container(
      color: Color(0xFFF4F4F4),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 52,
              height: 5,
              decoration: BoxDecoration(
                color: Color(0xFFACA9A9),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildOptionsRow(),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                '9 min',
                style: GoogleFonts.nunitoSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF365F67),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '(2,4 km)',
                style: GoogleFonts.nunitoSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w200,
                  color: Color(0xFF365F67),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(
            color: Color(0xFFD9D9D9),
            height: 2,
          ),
          const SizedBox(height: 12),
          Text(
            'Caminho',
            style: GoogleFonts.nunitoSans(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF365F67),
            ),
          ),
          const SizedBox(height: 12),
          _buildRouteStep(Icons.location_on, 'Mandim'),
          _buildRouteStep(Icons.arrow_upward, 'Siga para nordeste'),
        ],
      ),
    );
  }

  Widget _buildOptionsRow() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _buildOptionButton(
          'Partida às 18:04',
          icon: Icons.arrow_drop_down,
          onTap: () {},
        ),
        _buildOptionButton(
          'Evitar portagens',
          isActive: _avoidTolls,
          icon: _avoidTolls ? Icons.check : null,
          onTap: () {
            setState(() {
              _avoidTolls = !_avoidTolls;
            });
          },
        ),
        _buildOptionButton(
          'Evitar autoestradas',
          isActive: _avoidHighways,
          onTap: () {
            setState(() {
              _avoidHighways = !_avoidHighways;
            });
          },
        ),
      ],
    );
  }

  Widget _buildOptionButton(
    String label, {
    IconData? icon,
    bool isActive = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isActive ? Color(0xFFACA9A9) : Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(4),
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
                  color: Color(0xFF365F67),
                  size: icon == Icons.check ? 10 : 16,
                ),
              ),
            Text(
              label,
              style: GoogleFonts.nunitoSans(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFF365F67),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteStep(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Icon(
              icon,
              size: 16,
              color: Color(0xFF365F67),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFACA9A9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return SafeArea(
      top: false,
      child: Container(
        height: 64,
        color: AppColors.teakDark,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home, 'Home'),
            _buildNavItem(Icons.location_on, 'Map'),
            _buildNavItem(Icons.directions, 'Routes'),
            _buildNavItem(Icons.person, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white, size: 28),
      ],
    );
  }
}