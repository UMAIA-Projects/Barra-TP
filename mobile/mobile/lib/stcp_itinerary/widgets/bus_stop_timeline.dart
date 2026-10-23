import 'package:flutter/material.dart';
import '../models/itinerary_model.dart';
import '../theme/app_theme.dart';

class BusStopTimeline extends StatelessWidget {
  final List<BusStop> stops;

  const BusStopTimeline({
    Key? key,
    required this.stops,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(stops.length, (index) {
        final stop = stops[index];
        final isLast = index == stops.length - 1;

        return BusStopItem(
          stop: stop,
          isLast: isLast,
          stops: stops,
        );
      }),
    );
  }
}

class BusStopItem extends StatelessWidget {
  final BusStop stop;
  final bool isLast;
  final List<BusStop> stops;

  const BusStopItem({
    Key? key,
    required this.stop,
    required this.isLast,
    required this.stops,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color circleColor = AppTheme.greenColor;
    Color lineColor = AppTheme.greenColor;
    bool showInnerCircle = false;

    if (stop.isFinal) {
      circleColor = AppTheme.primaryColor;
    } else if (!stop.isCurrent) {
      circleColor = AppTheme.greenColor;
      if (stops.indexWhere((s) => s.isCurrent) > stops.indexOf(stop)) {
        lineColor = Color.fromARGB(
          (255 * 0.6).toInt(),
          44,
          185,
          1,
        );
      }
    }

    if (stop.isCurrent || (!stop.isFinal && stop != this.stops.last)) {
      showInnerCircle = true;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Column
          Column(
            children: [
              // Circle
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: circleColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: showInnerCircle
                    ? Center(
                        child: Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.25),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      )
                    : null,
              ),
              // Line
              if (!isLast)
                Container(
                  width: 2,
                  height: 32,
                  color: lineColor,
                  margin: const EdgeInsets.only(top: 2),
                ),
            ],
          ),
          const SizedBox(width: 16),

          // Content Column
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stop.name,
                              style: AppTheme.daysOne12,
                            ),
                            if (stop.description != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  stop.description!,
                                  style: AppTheme.nunito9,
                                ),
                              ),
                            if (stop.duration != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  stop.duration!,
                                  style: AppTheme.nunito9,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (stop.isCurrent && stop.nextTime != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.greyColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.25),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.schedule,
                                      color: AppTheme.textColor,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 4),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '8 min',
                                          style: AppTheme.nunito9Bold,
                                        ),
                                        Text(
                                          stop.nextTime!,
                                          style: AppTheme.nunito7,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (!isLast) const SizedBox(height: 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
