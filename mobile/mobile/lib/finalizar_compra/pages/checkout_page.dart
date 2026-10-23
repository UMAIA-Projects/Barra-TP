import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/payment_methods_card.dart';
import '../widgets/payment_form.dart';
import '../../common/navigation_bar.dart';
import '../../common/header_app.dart';

const Color brandColor = Color(0xFF365F67);
const Color brandLightColor = Color(0xFF407079);

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late PageController _pageController;
  int _currentNavIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNavBarTap(int index) {
    setState(() {
      _currentNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header (removida a barra de proteção que estava aqui)
          HeaderApp(),
          // Return button bar
          _buildReturnBar(),
          // Efetuar Compra badge - agora com largura total
          _buildEfetuarCompraBadge(),
          // Main content
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300]?.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Title
                      Text(
                        'Continue com o pagamento...',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: brandColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      // Subtitle
                      Text(
                        'Selecione o método de pagamento\ne conclue a sua compra!',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: brandColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      // Content grid
                      LayoutBuilder(
                        builder: (context, constraints) {
                          // Mobile layout
                          if (constraints.maxWidth < 600) {
                            return Column(
                              children: [
                                const PaymentMethodsCard(),
                                const SizedBox(height: 16),
                                const PaymentForm(),
                              ],
                            );
                          }
                          // Desktop/Tablet layout
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: const PaymentMethodsCard()),
                              const SizedBox(width: 16),
                              Expanded(child: const PaymentForm()),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      // Concluir Compra button
                      _buildSubmitButton(),
                      const SizedBox(height: 16),
                      // Divider
                      Container(
                        width: 220,
                        height: 2,
                        color: brandColor,
                      ),
                      const SizedBox(height: 16),
                      // Thank you message
                      Text(
                        'Obrigado por escolher Barra TP!',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: brandColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Bottom navigation
          CustomBottomBar(
            currentIndex: _currentNavIndex,
            onTabSelectedOverride: _onNavBarTap,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: brandColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
          Text(
            'BARRA TP',
            style: GoogleFonts.daysOne(
              fontSize: 45,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              shadows: [
                const Shadow(
                  blurRadius: 4,
                  color: Color.fromARGB(64, 0, 0, 0),
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.location_on, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildReturnBar() {
    return Container(
      color: brandLightColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.arrow_back, color: Colors.white, size: 24),
          const SizedBox(width: 8),
          Text(
            'Retornar',
            style: GoogleFonts.nunitoSans(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEfetuarCompraBadge() {
    return Container(
      color: brandLightColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Align( // Usar Align em vez de Center para controlar o alinhamento
        alignment: Alignment.centerLeft, // Alinha à esquerda
        child: Container(
          decoration: BoxDecoration(
            color: brandColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Reduzi o padding horizontal
          child: Text(
            'Efetuar Compra',
            style: GoogleFonts.daysOne(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 424),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle submit
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processando pagamento...')),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: brandColor,
          elevation: 4,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Concluir Compra',
          style: GoogleFonts.nunitoSans(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: Colors.white),
      activeIcon: Icon(icon, color: Colors.white),
      label: label,
    );
  }
}