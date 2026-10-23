import 'package:flutter/material.dart';
import '../models/station_model.dart';
import '../theme/colors.dart';
import '../../common/linhas_navigation_helper.dart';

class StationItem extends StatelessWidget {
  final Station station;
  final bool showLine;

  const StationItem({
    Key? key,
    required this.station,
    required this.showLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            LinhasNavigationHelper.navigateToPesquisaMetro(context);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Column(
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: AppColors.metroGreen,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: station.isActive
                      ? Container(
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                        )
                      : null,
                ),
                if (showLine)
                  Container(
                    width: 2,
                    height: 32,
                    margin: const EdgeInsets.only(top: 4),
                    color: station.lineOpacity == LineOpacity.light
                        ? AppColors.metroGreenLight
                        : AppColors.metroGreen,
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    station.name,
                    style: const TextStyle(
                      color: AppColors.metroText,
                      fontFamily: 'DaysOne',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    station.subtitle,
                    style: const TextStyle(
                      color: AppColors.metroText,
                      fontFamily: 'NunitoSans',
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.chevron_right, color: AppColors.metroText),
              onPressed: () {
                LinhasNavigationHelper.navigateToPesquisaMetro(context);
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
