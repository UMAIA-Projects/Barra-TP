import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../cart_modal.dart';
import '../filters_modal.dart';
import '../models/trip_model.dart';
import '../theme/app_theme.dart';
import '../widgets/search_form_widget.dart';
import '../widgets/sub_header.dart';
import '../widgets/trip_card_widget.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Trip> trips = [];
  bool _showFiltersDropdown = false;
  bool _showCartDropdown = false;

  @override
  void initState() {
    super.initState();
    _loadTrips();
  }

  void _loadTrips() {
    trips = [
      Trip(
        company: 'Barra TP',
        departureTime: '15:30',
        departureLocation: 'Lisboa (Oriente)',
        arrivalTime: '18:50',
        arrivalLocation: 'Porto (Campanhã)',
        price: '7,50€',
        availability: '1 lugar (adulto)',
        duration: '03h 20m',
        distance: '306km',
        isDirect: true,
        transportType: TransportType.bus,
      ),
      Trip(
        company: 'Barra TP',
        departureTime: '09:00',
        departureLocation: 'Braga',
        arrivalTime: '14:20',
        arrivalLocation: 'Lisboa (Oriente)',
        price: '19,90€',
        availability: '2 lugares disponíveis',
        duration: '05h 20m',
        distance: '430km',
        isDirect: true,
        hasStops: true,
        transportType: TransportType.bus,
      ),
      Trip(
        company: 'Barra TP',
        departureTime: '17:30',
        departureLocation: 'Lisboa (Oriente)',
        arrivalTime: '22:10',
        arrivalLocation: 'Madrid',
        price: '29,99€',
        availability: '1 lugar (adulto)',
        duration: '04h 40m',
        distance: '679km',
        isDirect: true,
        transportType: TransportType.plane,
      ),
    ];
  }

  void _toggleFiltersDropdown() {
    setState(() {
      _showFiltersDropdown = !_showFiltersDropdown;
      if (_showFiltersDropdown) _showCartDropdown = false;
    });
  }

  void _toggleCartDropdown() {
    setState(() {
      _showCartDropdown = !_showCartDropdown;
      if (_showCartDropdown) _showFiltersDropdown = false;
    });
  }

  void _openFullFilters() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const FiltersModal(),
    );
  }

  void _openFullCart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CartModal(),
    );
  }

  @override
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final isVerySmallScreen = screenWidth < 500;

  return Scaffold(
    body: Column(
      children: [
        const HeaderApp(),
        const SubHeaderReturn(),
        const SearchFormWidget(),
        
        // Área principal
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Linha de título e controles - TODOS LADO A LADO
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Resultados da Pesquisa (${trips.length})',
                          style: TextStyle(
                            fontSize: isVerySmallScreen ? 16 : 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.barrateal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildFilterButton(),
                      const SizedBox(width: 8),
                      _buildCartButton(),
                    ],
                  ),
                    
                    // Dropdown de Filtros
                    if (_showFiltersDropdown) ...[
                      const SizedBox(height: 12),
                      _buildFiltersDropdown(),
                      const SizedBox(height: 16),
                    ],
                    
                    // Dropdown do Carrinho
                    if (_showCartDropdown) ...[
                      const SizedBox(height: 12),
                      _buildCartDropdown(),
                      const SizedBox(height: 16),
                    ],
                    
                    const SizedBox(height: 16),
                    
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: trips.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) => TripCardWidget(trip: trips[index]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 1),
    );
  }

  Widget _buildFilterButton() {
    return InkWell(
      onTap: _toggleFiltersDropdown,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filtros',
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.barrateal,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              _showFiltersDropdown 
                ? Icons.expand_less 
                : Icons.expand_more,
              size: 18,
              color: AppColors.barrateal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartButton() {
    return InkWell(
      onTap: _toggleCartDropdown,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Carrinho',
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.barrateal,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              _showCartDropdown 
                ? Icons.expand_less 
                : Icons.expand_more,
              size: 18,
              color: AppColors.barrateal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFiltersDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.mediumGray),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filtros Rápidos',
                style: GoogleFonts.nunitoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.barrateal,
                ),
              ),
              TextButton(
                onPressed: _openFullFilters,
                child: Text(
                  'Ver todos',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    color: AppColors.barrateal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildFilterChip('Autocarro', true),
              _buildFilterChip('Avião', true),
              _buildFilterChip('Direta', false),
              _buildFilterChip('Com escalas', false),
              _buildFilterChip('Manhã', false),
              _buildFilterChip('Tarde', false),
              _buildFilterChip('Noite', false),
            ],
          ),
          
          const SizedBox(height: 16),
          
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showFiltersDropdown = false;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.barrateal,
              minimumSize: const Size(double.infinity, 40),
            ),
            child: Text(
              'Aplicar Filtros',
              style: GoogleFonts.nunitoSans(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool selected) {
    return ChoiceChip(
      label: Text(
        label,
        style: GoogleFonts.nunitoSans(
          fontSize: 11,
          color: selected ? Colors.white : AppColors.barrateal,
        ),
      ),
      selected: selected,
      onSelected: (value) {},
      backgroundColor: Colors.white,
      selectedColor: AppColors.barrateal,
      side: BorderSide(color: AppColors.barrateal),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      labelPadding: const EdgeInsets.symmetric(horizontal: 4),
    );
  }

  Widget _buildCartDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.mediumGray),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Resumo do Carrinho',
                style: GoogleFonts.nunitoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.barrateal,
                ),
              ),
              TextButton(
                onPressed: _openFullCart,
                child: Text(
                  'Ver carrinho completo',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    color: AppColors.barrateal,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Item do carrinho
          _buildCartItemPreview(),
          
          const SizedBox(height: 12),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '2 itens',
                style: GoogleFonts.nunitoSans(
                  fontSize: 12,
                  color: AppColors.darkGray,
                ),
              ),
              Text(
                '37,49€',
                style: GoogleFonts.nunitoSans(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColors.barrateal,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showCartDropdown = false;
              });
              _openFullCart();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              minimumSize: const Size(double.infinity, 40),
            ),
            child: Text(
              'Finalizar Compra',
              style: GoogleFonts.nunitoSans(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemPreview() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.barrateal,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Icon(
              Icons.directions_bus,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lisboa → Porto',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '15:30 - 18:50 • 1x Adulto',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 10,
                    color: AppColors.darkGray,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '7,50€',
            style: GoogleFonts.nunitoSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.barrateal,
            ),
          ),
        ],
      ),
    );
  }
}