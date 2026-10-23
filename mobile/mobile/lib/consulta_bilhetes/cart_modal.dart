import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/trip_model.dart';
import 'theme/app_theme.dart';
import '../../carrinho_final/screens/cart_verification_screen.dart' as carrinho_final;

class CartModal extends StatefulWidget {
  const CartModal({Key? key}) : super(key: key);

  @override
  State<CartModal> createState() => _CartModalState();
}

class _CartModalState extends State<CartModal> {
  final List<Trip> _cartItems = [
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

  void _removeFromCart(int index) {
    setState(() {
      _cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              // Handle para arrastar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.mediumGray,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Cabeçalho
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Carrinho',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.barrateal,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.barrateal.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${_cartItems.length} items',
                        style: GoogleFonts.nunitoSans(
                          color: AppColors.barrateal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Conteúdo rolável
              Expanded(
                child: _cartItems.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 64,
                              color: AppColors.mediumGray,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Carrinho vazio',
                              style: GoogleFonts.nunitoSans(
                                fontSize: 18,
                                color: AppColors.darkGray,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Adicione viagens ao carrinho',
                              style: GoogleFonts.nunitoSans(
                                color: AppColors.darkGray,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _cartItems.length,
                                separatorBuilder: (_, __) => const SizedBox(height: 12),
                                itemBuilder: (context, index) {
                                  final trip = _cartItems[index];
                                  return _buildCartItem(trip, index);
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
              ),

              // Resumo e botões
              if (_cartItems.isNotEmpty) ...[
                // Resumo do preço
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    border: Border(top: BorderSide(color: AppColors.mediumGray)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: GoogleFonts.nunitoSans(
                              color: AppColors.darkGray,
                            ),
                          ),
                          Text(
                            '37,49€',
                            style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Taxas',
                            style: GoogleFonts.nunitoSans(
                              color: AppColors.darkGray,
                            ),
                          ),
                          Text(
                            '2,50€',
                            style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Divider(color: AppColors.mediumGray),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.nunitoSans(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.barrateal,
                            ),
                          ),
                          Text(
                            '39,99€',
                            style: GoogleFonts.nunitoSans(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.barrateal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Botões de ação
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(color: AppColors.mediumGray)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(color: AppColors.barrateal),
                          ),
                          child: Text(
                            'Continuar a Comprar',
                            style: GoogleFonts.nunitoSans(
                              color: AppColors.barrateal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const carrinho_final.CartVerificationScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.barraorange,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: Text(
                            'Finalizar Compra',
                            style: GoogleFonts.nunitoSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildCartItem(Trip trip, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.mediumGray),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ícone do transporte
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: trip.transportType == TransportType.bus
                        ? AppColors.barrateal
                        : AppColors.blue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    trip.transportType == TransportType.bus
                        ? Icons.directions_bus
                        : Icons.flight,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),

                // Detalhes da viagem
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${trip.departureLocation} → ${trip.arrivalLocation}',
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${trip.departureTime} - ${trip.arrivalTime}',
                        style: GoogleFonts.nunitoSans(
                          color: AppColors.darkGray,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        trip.company,
                        style: GoogleFonts.nunitoSans(
                          color: AppColors.barrateal,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                // Preço e botão de remover
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      trip.price,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.barraorange,
                      ),
                    ),
                    const SizedBox(height: 8),
                    IconButton(
                      onPressed: () => _removeFromCart(index),
                      icon: const Icon(Icons.delete_outline, size: 20),
                      color: AppColors.darkGray,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Informações adicionais
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.access_time,
                  size: 14,
                  color: AppColors.darkGray,
                ),
                const SizedBox(width: 4),
                Text(
                  trip.duration,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    color: AppColors.darkGray,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.linear_scale,
                  size: 14,
                  color: AppColors.darkGray,
                ),
                const SizedBox(width: 4),
                Text(
                  trip.distance,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    color: AppColors.darkGray,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: trip.isDirect 
                        ? Colors.green.withOpacity(0.1) 
                        : Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    trip.isDirect ? 'Direta' : 'Com Escalas',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 10,
                      color: trip.isDirect 
                          ? Colors.green.shade800 
                          : Colors.orange.shade800,
                      fontWeight: FontWeight.w600,
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
}