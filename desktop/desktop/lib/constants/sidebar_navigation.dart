import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/responsive_utils.dart';
import 'package:desktop/Planeamento/screens/planeamento_inicial_screen.dart';
import 'package:desktop/Consulta/HomePage/screens/home_screen.dart';
import 'package:desktop/linhas/screens/linhas_favoritas_screen.dart';
import 'package:desktop/Aluguer/Aluguer/screens/aluguer_screen.dart';
import 'package:desktop/Mapa_Offiline/pages/mapa_offline_satelite_screen.dart';
import 'package:desktop/areaprivada/areaprivada_1/screens/area_privada_screen.dart';

class SidebarNavigation extends StatelessWidget {
  final String? activePage;

  const SidebarNavigation({super.key, this.activePage});

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
        'label': 'Consulta',
        'icon': Icons.search,
        'color': BarraColors.lightGreen,
      },
      {
        'label': 'Planeamento',
        'icon': Icons.calendar_today,
        'color': BarraColors.lightTeal,
      },
      {
        'label': 'Linhas',
        'icon': Icons.route,
        'color': BarraColors.lightGreen,
      },
      {
        'label': 'Aluguer',
        'icon': Icons.directions_car,
        'color': BarraColors.lightTeal,
      },
      {
        'label': 'Mapa Offline',
        'icon': Icons.map_outlined,
        'color': BarraColors.lightGreen,
      },
      {
        'label': 'Área Privada',
        'icon': Icons.person,
        'color': BarraColors.lightTeal,
      },
    ];

    return Column(
      children: items.map((item) {
        final isSelected = activePage != null && activePage == item['label'];
        final overflowWidth = responsive.sidebarWidth + responsive.scaleUniform(10);
        
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
                  ),
                )
              : _NavItem(
                  label: item['label'],
                  icon: item['icon'],
                  bgColor: item['color'],
                  isSelected: false,
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

  const _NavItem({
    required this.label,
    required this.icon,
    required this.bgColor,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final overflowWidth = responsive.sidebarWidth + responsive.scaleUniform(10);
    final containerWidth = isSelected ? overflowWidth : double.infinity;
    
    return GestureDetector(
      onTap: () {
        switch (label) {
          case 'Consulta':
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
            break;

          case 'Planeamento':
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => PlaneamentoInicialScreen()),
            );
            break;

          case 'Linhas':
           Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => LinhasFavoritasScreen()),
            );
            break;

          case 'Aluguer':
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => AluguerScreen()),
            );
            break;
            
          case 'Mapa Offline':
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => MapaOffline_Satelite_Screen()),
            );
            break;

          case 'Área Privada':
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => AreaprivadaScreen()),
            );
            break;
        }
      },
      child: Container(
        width: containerWidth,
        padding: EdgeInsets.all(responsive.scaleUniform(30)),
        margin: EdgeInsets.only(right: responsive.scaleUniform(12)),
        decoration: BoxDecoration(
          color: bgColor,
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
              color: BarraColors.teal,
              size: responsive.scaleUniform(40),
            ),
            SizedBox(width: responsive.scaleUniform(24)),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.nunitoSans(
                  color: BarraColors.teal,
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
