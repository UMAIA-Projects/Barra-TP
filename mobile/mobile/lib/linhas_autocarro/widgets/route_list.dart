import 'package:flutter/material.dart';
import '../models/route_model.dart';
import '../constants/colors.dart';
import '../../common/linhas_navigation_helper.dart';

class RouteList extends StatelessWidget {
  final String searchQuery;

  const RouteList({
    Key? key,
    this.searchQuery = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filteredRoutes = searchQuery.isEmpty
        ? RouteData.allRoutes
        : RouteData.allRoutes.where((route) {
            return route.number.toLowerCase().contains(searchQuery.toLowerCase()) ||
                route.from.toLowerCase().contains(searchQuery.toLowerCase()) ||
                route.to.toLowerCase().contains(searchQuery.toLowerCase());
          }).toList();

    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.transportGray,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Text(
                  'STCP - Sociedade de Transportes Coletivos do Porto',
                  style: TextStyle(
                    color: AppColors.transportTeal,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ...List.generate(filteredRoutes.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: RouteItem(route: filteredRoutes[index]),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class RouteItem extends StatelessWidget {
  final TransportRoute route;

  const RouteItem({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isBus = route.type == RouteType.bus;

    return GestureDetector(
      onTap: () {
        LinhasNavigationHelper.navigateToStcpItinerary(context);
      },
      child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 20,
                decoration: BoxDecoration(
                  color: isBus ? AppColors.transportCyan : AppColors.white,
                  border: isBus ? null : Border.all(color: AppColors.transportTeal),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.directions_bus,
                  color: AppColors.transportTeal,
                  size: 16,
                ),
              ),
              const SizedBox(width: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: isBus ? AppColors.transportCyan : AppColors.white,
                  border: isBus ? null : Border.all(color: AppColors.transportTeal),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  route.number,
                  style: TextStyle(
                    color: isBus ? AppColors.transportTeal : AppColors.transportTeal,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  route.from,
                  style: const TextStyle(
                    color: AppColors.transportTeal,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.swap_horiz,
                  color: AppColors.transportTeal,
                  size: 14,
                ),
              ),
              Expanded(
                child: Text(
                  route.to,
                  style: const TextStyle(
                    color: AppColors.transportTeal,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
