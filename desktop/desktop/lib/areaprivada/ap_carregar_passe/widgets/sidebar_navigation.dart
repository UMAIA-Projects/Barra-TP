import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/routes.dart';

class SidebarNavigation extends StatelessWidget {
  final String? activePage;

  const SidebarNavigation({super.key, this.activePage});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    if (isMobile) return const SizedBox.shrink();

    final screenHeight = MediaQuery.of(context).size.height;
    const footerHeight = 35.0;

    return Container(
      width: 320,
      height: screenHeight - footerHeight,
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _LogoCard(),
          _NavigationItems(activePage: activePage),   
        ],
      ),
    );
  }
}

class _LogoCard extends StatelessWidget {
  const _LogoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: AppColors.barraTeal,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.circular(24),
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 8,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(1, 18, 20, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'BARRA',
            style: GoogleFonts.daysOne(
              color: Colors.white,
              fontSize: 42,
              shadows: [
                Shadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  offset: Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TP',
                style: GoogleFonts.daysOne(
                  color: Colors.white,
                  fontSize: 50,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 48,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavigationItems extends StatelessWidget {
  final String? activePage;

  const _NavigationItems({this.activePage});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavData('Bilhetes', Icons.card_giftcard),
      _NavData('Viagens', Icons.work_outline),
      _NavData('Multas', Icons.block),
      _NavData('Passe Digital', Icons.credit_card),
      _NavData('Descontos', Icons.local_offer),
      _NavData('Área Privada', Icons.person),
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        final isSelected = activePage != null && activePage == item.label;
        return _NavItem(
          data: item,
          isSelected: isSelected,  
        );
      }).toList(),
    );
  }
}

class _NavData {
  final String label;
  final IconData icon;

  _NavData(this.label, this.icon);
}

class _NavItem extends StatefulWidget {
  final _NavData data;
  final bool isSelected;

  const _NavItem({
    required this.data,
    required this.isSelected,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          switch (widget.data.label) {
            case 'Bilhetes':
              Navigator.pushNamed(context, AppRoutes.consulta);
              break;

            case 'Viagens':
              Navigator.pushNamed(context, AppRoutes.planeamento);
              break;

            case 'Multas':
              Navigator.pushNamed(context, AppRoutes.linhas);
              break;

            case 'Passe Digital':
              Navigator.pushNamed(context, AppRoutes.passeDigital);
              break;
              
            case 'Descontos':
              Navigator.pushNamed(context, AppRoutes.mapaOffiline);
              break;

            case 'Área Privada':
              Navigator.pushNamed(context, AppRoutes.areaprivada);
              break;
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 300,
          padding: const EdgeInsets.fromLTRB(8, 20, 22, 20),
          decoration: BoxDecoration(
            color: widget.isSelected 
                ? AppColors.mintGreen 
                : (isHovered 
                    ? AppColors.cyanLight.withValues(alpha: 0.8)
                    : AppColors.cyanLight),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isHovered ? 0.2 : 0.15),
                blurRadius: isHovered ? 6 : 4,
                offset: Offset(2, isHovered ? 3 : 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(
                widget.data.icon,
                color: AppColors.barraTeal,
                size: 38,
              ),
              const SizedBox(width: 22),
              Text(
                widget.data.label,
                style: GoogleFonts.nunitoSans(
                  color: AppColors.barraTeal,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}