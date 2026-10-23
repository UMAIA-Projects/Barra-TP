import 'package:flutter/material.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/constants/responsive_utils.dart';
import 'package:desktop/constants/searchbar_widget.dart';
import 'package:desktop/linhas/widgets/status_sidebar.dart';
import 'package:desktop/linhas/widgets/transit_tabs.dart';
import 'package:desktop/linhas/widgets/train_stations_content.dart';
import 'package:desktop/linhas/models/safe_image.dart';

class LinhasComboiosScreen extends StatelessWidget {
  const LinhasComboiosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return BaseScreen(
      activePage: 'Linhas',
      showSearchBar: true,
      customSearchBar: const SearchBarWidget(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive.spacing(16),
              vertical: responsive.spacing(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      const TransitTabs(selectedTab: 'Comboios'),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                        decoration: const BoxDecoration(
                          color: Color(0xFFD4D4D8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x40000000),
                              offset: Offset(0, 6),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Comboios - Linhas',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF475569),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x80000000),
                                    offset: Offset(5, 5),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: SafeNetworkImage(
                                imageUrl: 'https://api.builder.io/api/v1/image/assets/TEMP/cca9b7a2e97c0b9bffd5d299567baee8a65db7c7?placeholderIfAbsent=true&apiKey=5bf24c79288943a0b813bd69f2b4f279',
                                width: 35,
                                height: 35,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const TrainStationsContent(),
                    ],
                  ),
                ),
                SizedBox(width: responsive.spacing(24)),
                SizedBox(
                  width: 380,
                  child: Padding(
                    padding: EdgeInsets.only(top: responsive.spacing(45)),
                    child: const StatusSidebar(),
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
