import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/responsive_utils.dart';
import 'package:desktop/areaprivada/areaprivada_1/screens/area_privada_screen.dart';
import 'package:desktop/areaprivada/ap_passse_digital/screens/passe_digital_screen.dart';
import 'package:desktop/Consulta/HomePage/screens/home_screen.dart';

class SidebarNavigationAP extends StatelessWidget {
  final String? activePage;

  const SidebarNavigationAP({super.key, this.activePage});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return SizedBox(
      width: responsive.sidebarWidth,
      child: Column(
        children: [
          const _LogoCard(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: responsive.footerHeight),
              child: _NavigationItems(activePage: activePage),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoCard extends StatelessWidget {
  const _LogoCard();

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      },
      child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: responsive.scaleUniform(12)),
      decoration: BoxDecoration(
        color: BarraColors.teal,
        borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.circular(responsive.scaleUniform(24)),
          bottomLeft: Radius.zero,
          bottomRight: Radius.circular(responsive.scaleUniform(24)),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.25),
            blurRadius: responsive.scaleUniform(8),
            offset: Offset(
              responsive.scaleUniform(2), 
              responsive.scaleUniform(2)
            ),
          ),
        ],
      ),
      padding: EdgeInsets.all(responsive.scaleUniform(40)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'BARRA',
            style: GoogleFonts.daysOne(
              color: AppColors.white,
              fontSize: responsive.scaleFontSize(48),
              fontWeight: FontWeight.w400,
              shadows: [
                Shadow(
                  color: AppColors.black.withOpacity(0.25),
                  offset: Offset(0, responsive.scaleUniform(4)),
                  blurRadius: responsive.scaleUniform(4),
                ),
              ],
            ),
          ),
          SizedBox(height: responsive.scaleUniform(6)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'TP',
                style: GoogleFonts.daysOne(
                  color: AppColors.white,
                  fontSize: responsive.scaleFontSize(48),
                  fontWeight: FontWeight.w400,
                  shadows: [
                    Shadow(
                      color: AppColors.black.withOpacity(0.25),
                      offset: Offset(0, responsive.scaleUniform(4)),
                      blurRadius: responsive.scaleUniform(4),
                    ),
                  ],
                ),
              ),
              SizedBox(width: responsive.scaleUniform(6)),
              Icon(
                Icons.location_on,
                color: AppColors.white,
                size: responsive.scaleUniform(54),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}

class _NavigationItems extends StatelessWidget {
  final String? activePage;

  const _NavigationItems({this.activePage});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    
    final List<Map<String, dynamic>> items = [
      {
        'label': 'Bilhetes',
        'icon': Icons.card_giftcard,
        'color': BarraColors.lightGreen,
        'enabled': false,
      },
      {
        'label': 'Viagens',
        'icon': Icons.work_outline,
        'color': BarraColors.lightTeal,
        'enabled': false,
      },
      {
        'label': 'Multas',
        'icon': Icons.block,
        'color': BarraColors.lightGreen,
        'enabled': false,
      },
      {
        'label': 'Passe Digital',
        'icon': Icons.credit_card,
        'color': BarraColors.lightTeal,
        'enabled': true,
      },
      {
        'label': 'Descontos',
        'icon': Icons.local_offer,
        'color': BarraColors.lightGreen,
        'enabled': false,
      },
      {
        'label': 'Área Privada',
        'icon': Icons.person,
        'color': BarraColors.lightTeal,
        'enabled': true,
      },
    ];

    return Column(
      children: items.map((item) {
        final isSelected = activePage != null && activePage == item['label'];
        final overflowWidth = responsive.sidebarWidth + responsive.scaleUniform(10);
        final isEnabled = item['enabled'] as bool? ?? true;
        
        return Expanded(
          child: isSelected
              ? OverflowBox(
                  minWidth: overflowWidth,
                  maxWidth: overflowWidth,
                  alignment: Alignment.centerLeft,
                  child: _NavItem(
                    label: item['label'],
                    icon: item['icon'],
                    bgColor: item['color'],
                    isSelected: true,
                    enabled: isEnabled,
                  ),
                )
              : _NavItem(
                  label: item['label'],
                  icon: item['icon'],
                  bgColor: item['color'],
                  isSelected: false,
                  enabled: isEnabled,
                ),
        );
      }).toList(),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final bool isSelected;
  final bool enabled;

  const _NavItem({
    required this.label,
    required this.icon,
    required this.bgColor,
    this.isSelected = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final overflowWidth = responsive.sidebarWidth + responsive.scaleUniform(10);
    final containerWidth = isSelected ? overflowWidth : double.infinity;
    
    return GestureDetector(
      onTap: enabled ? () {
        switch (label) {
          case 'Bilhetes':
            break;
          case 'Viagens':
            break;
          case 'Multas':
            break;
          case 'Passe Digital':
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const PasseDigitalScreen()),
            );
            break;
          case 'Descontos':
            break;
          case 'Área Privada':
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const AreaprivadaScreen()),
            );
            break;
        }
      } : null,
      child: Container(
        width: containerWidth,
        padding: EdgeInsets.all(responsive.scaleUniform(30)),
        margin: EdgeInsets.only(right: responsive.scaleUniform(12)),
        decoration: BoxDecoration(
          color: enabled ? bgColor : bgColor.withOpacity(0.5),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(responsive.scaleUniform(24)),
            bottomRight: Radius.circular(responsive.scaleUniform(24)),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.15),
              blurRadius: responsive.scaleUniform(4),
              offset: Offset(
                responsive.scaleUniform(2),
                responsive.scaleUniform(2),
              ),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: enabled ? BarraColors.teal : BarraColors.teal.withOpacity(0.5),
              size: responsive.scaleUniform(40),
            ),
            SizedBox(width: responsive.scaleUniform(24)),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.nunitoSans(
                  color: enabled ? BarraColors.teal : BarraColors.teal.withOpacity(0.5),
                  fontSize: responsive.scaleFontSize(24),
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.visible,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
