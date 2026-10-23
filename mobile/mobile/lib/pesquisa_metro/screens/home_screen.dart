import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/metro_provider.dart';
import '../../theme/app_colors.dart';
import '../widgets/arrival_card.dart';
import '../widgets/arrivals_header.dart';
import '../widgets/metro_breadcrumb.dart';
import '../widgets/metro_header.dart';
import '../../common/navigation_bar.dart';
import '../widgets/station_badge.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return Scaffold(
      appBar: MetroHeader(),
      body: Column(
        children: [
          MetroBreadcrumb(
            lineCode: 'C',
            location: 'Viagem de Metro',
          ),
          StationBadge(
            stationName: 'Fórum Maia',
          ),
          Expanded(
            child: Consumer<MetroProvider>(
              builder: (context, provider, _) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height - 300,
                      ),
                      child: Column(
                        spacing: 16,
                        children: [
                          ArrivalsHeader(),
                          ...provider.currentStation.nextArrivals.map(
                            (line) => ArrivalCard(line: line),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(currentIndex: 3),
    );
  }
}
