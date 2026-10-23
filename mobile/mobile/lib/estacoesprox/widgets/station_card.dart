import 'package:flutter/material.dart';
import '../models/station_model.dart';
import '../theme/app_colors.dart';
import '../providers/navigation_provider.dart';
import 'package:provider/provider.dart';

class StationCard extends StatelessWidget {
  final Station station;

  const StationCard({Key? key, required this.station}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, nav, child) {
        final isExpanded = nav.expandedStation == station.id;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xFF365F67)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  constraints: const BoxConstraints(minHeight: 36),
                  decoration: const BoxDecoration(
                    color: Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (station.type == 'metro')
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.network(
                            'https://img.favpng.com/19/4/10/porto-metro-rapid-transit-logo-organization-metro-do-porto-sa-png-favpng-LH3XkwLcUnU8WXKGcKF0m6uy7.jpg',
                            height: 20,
                            width: 20,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.train_rounded,
                                size: 17,
                                color: const Color(0xFF365F67),
                              );
                            },
                          ),
                        ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              station.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF365F67),
                              ),
                            ),
                            Text(
                              station.walkTime,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 8,
                                color: Color(0xFF365F67),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (station.logoUrl != null)
                        Image.network(
                          station.logoUrl!,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                    ],
                  ),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Schedules section (for metro stations)
                      if (station.schedules != null && station.schedules!.isNotEmpty)
                        _buildSchedulesSection(context, station),
                      // Bus routes section
                      if (station.busRoutes.isNotEmpty)
                        _buildBusRoutesSection(context, station, nav),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSchedulesSection(BuildContext context, Station station) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Horários da Estação:',
          style: TextStyle(
            color: Color(0xFF365F67),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ...station.schedules!.map((schedule) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2CB901),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      schedule.lineCode,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    schedule.direction,
                    style: const TextStyle(
                      color: Color(0xFF365F67),
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  schedule.time,
                  style: const TextStyle(
                    color: Color(0xFF365F67),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    border: Border.all(color: const Color(0xFF365F67)),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    schedule.duration,
                    style: const TextStyle(
                      color: Color(0xFF365F67),
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildBusRoutesSection(
      BuildContext context, Station station, NavigationProvider nav) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Autocarros da Paragem:',
          style: TextStyle(
            color: Color(0xFF365F67),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        ...station.busRoutes.map((route) {
          final badgeColor = route.badgeColor == 'blue'
              ? const Color(0xFFA5CCE9)
              : const Color(0xFF76F5E0);

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    route.number,
                    style: const TextStyle(
                      color: Color(0xFF365F67),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    route.destination,
                    style: const TextStyle(
                      color: Color(0xFF365F67),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => nav.toggleStation(station.id),
                  child: Icon(
                    Icons.expand_more,
                    color: const Color(0xFF365F67),
                    size: 20,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}