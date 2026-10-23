import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/app_theme.dart';
import '../models/trip.dart';
import '../widgets/back_button_section.dart';
import '../widgets/trip_item.dart';
import '../widgets/verification_badge.dart';

import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';
import '../../finalizar_compra/pages/checkout_page.dart' as finalizar_compra;

// Adicione a importação da tela de pagamento
// import '../payment_screen.dart'; // Descomente se tiver uma tela de pagamento

class CartVerificationScreen extends StatefulWidget {
  const CartVerificationScreen({Key? key}) : super(key: key);

  @override
  State<CartVerificationScreen> createState() =>
      _CartVerificationScreenState();
}

class _CartVerificationScreenState extends State<CartVerificationScreen> {

  final CartData cartData = CartData(
    trips: [
      Trip(
        departureTime: '15:30',
        departureStation: 'Lisboa (Oriente)',
        arrivalTime: '18:50',
        arrivalStation: 'Porto (Campanhã)',
        passengers: '1x Adulto (20 a 64)',
        date: '08-12-2025',
        price: '7,50€',
      ),
      Trip(
        departureTime: '13:30',
        departureStation: 'Porto (Campanhã)',
        arrivalTime: '16:50',
        arrivalStation: 'Braga',
        passengers: '1x Adulto (20 a 64)',
        date: '17-12-2025',
        price: '5,30€',
      ),
    ],
    additionalFees: '1,50€',
    total: '14,30€',
  );

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: AppColors.background,

      // ================= BODY =================
      body: Column(
        children: [
          const HeaderApp(), // ✅ HEADER COMMON

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const BackButtonSection(),
                  const VerificationBadge(),

                  // Main content
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : 32,
                      vertical: 24,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: isMobile ? double.infinity : 720,
                    ),
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(maxWidth: 400),
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          borderRadius: BorderRadius.circular(21),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              offset: const Offset(0, 4),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTitle(),
                            const SizedBox(height: 24),

                            ...cartData.trips
                                .map((trip) => TripItem(trip: trip)),

                            const SizedBox(height: 16),
                            _buildTotals(),
                          ],
                        ),
                      ),
                    ),
                  ),

                  _buildActionButtons(context),
                ],
              ),
            ),
          ),
        ],
      ),

      // ================= BOTTOM NAV =================
      bottomNavigationBar: const CustomBottomBar(
        currentIndex: 2,
      ),
    );
  }

  // ================= UI PARTS =================

  Widget _buildTitle() {
    return Column(
      children: [
        Center(
          child: Text(
            'Carrinho',
            style: GoogleFonts.nunitoSans(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  offset: const Offset(0, 3.5),
                  blurRadius: 3.5,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Container(
            width: 140,
            height: 3.5,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildTotals() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Taxas adicionais:',
              style: GoogleFonts.nunitoSans(
                fontSize: 17.5,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              cartData.additionalFees,
              style: GoogleFonts.nunitoSans(
                fontSize: 17.5,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(height: 2.6, color: AppColors.textPrimary),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Total: ${cartData.total}',
              style: GoogleFonts.nunitoSans(
                fontSize: 19,
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _showCancelDialog(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.error, // Vermelho
                    foregroundColor: Colors.white,   // TEXTO BRANCO
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Cancelar'),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _navigateToPaymentScreen(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success, // Verde
                    foregroundColor: Colors.white,      // TEXTO BRANCO
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('Efetuar pagamento'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= DIALOGS =================

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Cancelar'),
        content:
            const Text('Tem a certeza que deseja cancelar esta reserva?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Reserva cancelada')),
              );
            },
            child: const Text('Sim'),
          ),
        ],
      ),
    );
  }

  void _navigateToPaymentScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const finalizar_compra.CheckoutPage(),
      ),
    );
  }
}