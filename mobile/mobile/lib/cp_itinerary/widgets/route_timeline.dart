import 'package:flutter/material.dart';
import '../models/station.dart';
import '../theme/app_colors.dart';

class RouteTimeline extends StatelessWidget {
  final List<Station> stations;

  const RouteTimeline({
    Key? key,
    required this.stations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        children: [
          for (int i = 0; i < stations.length; i++)
            _StationItem(
              station: stations[i],
              isLast: i == stations.length - 1,
            ),
        ],
      ),
    );
  }
}

class _StationItem extends StatelessWidget {
  final Station station;
  final bool isLast;

  const _StationItem({
    Key? key,
    required this.station,
    required this.isLast,
  }) : super(key: key);

  Color _getDotColor() {
    switch (station.type) {
      case StationType.start:
        return AppColors.routeGreen;
      case StationType.end:
        return AppColors.teal;
      default:
        return AppColors.routeGreen;
    }
  }

  bool _hasInnerCircle() {
    return station.type == StationType.stop || station.type == StationType.nearest;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: _getDotColor(),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: _hasInnerCircle()
                  ? Center(
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 32,
                margin: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.routeGreen,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  station.name,
                  style: TextStyle(
                    fontFamily: 'DaysOne',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.teal,
                    height: 1.2,
                  ),
                ),
                if (station.subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    station.subtitle!,
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      color: AppColors.teal,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
