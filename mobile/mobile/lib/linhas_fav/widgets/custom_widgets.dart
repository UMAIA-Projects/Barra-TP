import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../models/transport_models.dart';

class BarraAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BarraAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.teal,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: Colors.white, size: 32),
          Text(
            'BARRA TP',
            style: GoogleFonts.daysOne(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          Icon(Icons.location_on, color: Colors.white, size: 32),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class SearchBar extends StatelessWidget {
  final Function(String)? onChanged;

  const SearchBar({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grayLight,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Pesquisar linha...',
          hintStyle: TextStyle(
            color: AppColors.grayDark,
            fontSize: 13,
            fontFamily: GoogleFonts.nunitoSans().fontFamily,
          ),
          prefixIcon: null,
          suffixIcon: Icon(Icons.search, color: Colors.black87, size: 20),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        style: TextStyle(
          fontSize: 13,
          fontFamily: GoogleFonts.nunitoSans().fontFamily,
        ),
      ),
    );
  }
}

class NavigationTabs extends StatefulWidget {
  final Function(String) onTabChanged;
  final String selectedTab;

  const NavigationTabs({
    Key? key,
    required this.onTabChanged,
    required this.selectedTab,
  }) : super(key: key);

  @override
  State<NavigationTabs> createState() => _NavigationTabsState();
}

class _NavigationTabsState extends State<NavigationTabs> {
  final List<String> tabs = ['Favoritos', 'Todos', 'Autocarro', 'Comboio', 'Metro'];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.teal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Icon(Icons.notifications, color: Colors.white, size: 20),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: tabs.map((tab) {
                  final isSelected = widget.selectedTab == tab.toLowerCase();
                  return GestureDetector(
                    onTap: () => widget.onTabChanged(tab.toLowerCase()),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.tealLight : AppColors.teal,
                        border: Border(
                          right: BorderSide(color: AppColors.teal, width: 1),
                        ),
                      ),
                      child: Text(
                        tab,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final bool showIcons;

  const SectionHeader({
    Key? key,
    required this.title,
    this.showIcons = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.gray,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.nunitoSans(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.teal,
            ),
          ),
          if (showIcons)
            Row(
              children: [
                _BusIcon(),
                const SizedBox(width: 8),
                _TrainIcon(),
              ],
            ),
        ],
      ),
    );
  }
}

class MetroStationCard extends StatelessWidget {
  final MetroStation station;

  const MetroStationCard({
    Key? key,
    required this.station,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _StarIcon(),
            const SizedBox(width: 8),
            Image.network(
              station.icon,
              width: 32,
              height: 32,
              errorBuilder: (context, error, stackTrace) =>
                  Container(width: 32, height: 32, color: AppColors.gray),
            ),
            const SizedBox(width: 8),
            Text(
              station.name,
              style: GoogleFonts.nunitoSans(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.teal,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.teal,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.location_on, color: Colors.white, size: 16),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...station.routes.map((route) => MetroRouteItem(route: route)).toList(),
      ],
    );
  }
}

class MetroRouteItem extends StatelessWidget {
  final MetroRoute route;

  const MetroRouteItem({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, bottom: 8),
      child: Row(
        children: [
          _StarIcon(size: 12),
          const SizedBox(width: 8),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: AppColors.green,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                route.line,
                style: GoogleFonts.roboto(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            route.name,
            style: GoogleFonts.nunitoSans(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.teal,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.teal),
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.schedule, size: 12, color: AppColors.teal),
                const SizedBox(width: 4),
                Text(
                  route.time,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: AppColors.teal,
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

class BusRouteCard extends StatelessWidget {
  final BusRoute route;

  const BusRouteCard({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = route.color == 'cyan' ? AppColors.cyan : AppColors.greenLight;
    
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _BusIcon(size: 16),
              const SizedBox(width: 4),
              Text(
                route.number,
                style: GoogleFonts.nunitoSans(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.teal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            children: [
              Text(
                route.from,
                style: GoogleFonts.nunitoSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.teal,
                ),
              ),
              const SizedBox(width: 4),
              _ArrowsIcon(),
              const SizedBox(width: 4),
              Text(
                route.to,
                style: GoogleFonts.nunitoSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.teal,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TrainRouteCard extends StatelessWidget {
  final TrainRoute route;

  const TrainRouteCard({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = route.isOutline ? Colors.white : AppColors.greenLight;
    final borderColor = route.isOutline ? AppColors.teal : Colors.transparent;
    
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: bgColor,
            border: route.isOutline ? Border.all(color: borderColor) : null,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _TrainIcon(size: 18),
              const SizedBox(width: 4),
              Text(
                route.code,
                style: GoogleFonts.nunitoSans(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppColors.teal,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            route.name,
            style: GoogleFonts.nunitoSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.teal,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  final Function(int) onIndexChanged;
  final int selectedIndex;

  const BottomNavigationBar({
    Key? key,
    required this.onIndexChanged,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.teal,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomNavItem(
            icon: Icons.home,
            isSelected: selectedIndex == 0,
            onTap: () => onIndexChanged(0),
          ),
          _BottomNavItem(
            icon: Icons.location_on,
            isSelected: selectedIndex == 1,
            onTap: () => onIndexChanged(1),
          ),
          _BottomNavItem(
            icon: Icons.directions_bus,
            isSelected: selectedIndex == 2,
            onTap: () => onIndexChanged(2),
          ),
          _BottomNavItem(
            icon: Icons.person,
            isSelected: selectedIndex == 3,
            onTap: () => onIndexChanged(3),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: Colors.white, size: 32),
    );
  }
}

class _StarIcon extends StatelessWidget {
  final double size;

  const _StarIcon({this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.star, color: AppColors.yellow, size: size);
  }
}

class _BusIcon extends StatelessWidget {
  final double size;

  const _BusIcon({this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.directions_bus, color: AppColors.teal, size: size);
  }
}

class _TrainIcon extends StatelessWidget {
  final double size;

  const _TrainIcon({this.size = 24});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.train, color: Colors.white, size: size);
  }
}

class _ArrowsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.chevron_right, color: AppColors.teal, size: 16),
        Icon(Icons.chevron_left, color: AppColors.teal, size: 16),
      ],
    );
  }
}

class SubsectionHeader extends StatelessWidget {
  final String title;

  const SubsectionHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 12, bottom: 8),
      child: Row(
        children: [
          _BusIcon(size: 16),
          const SizedBox(width: 8),
          Text(
            title,
            style: GoogleFonts.nunitoSans(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
