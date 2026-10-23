import 'package:flutter/material.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/constants/responsive_utils.dart';
import 'package:desktop/constants/searchbar_widget.dart';
import 'package:desktop/linhas/widgets/status_sidebar.dart';
import 'package:desktop/linhas/widgets/transit_content.dart';

class LinhasFavoritasScreen extends StatelessWidget {
  const LinhasFavoritasScreen({super.key});

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
                  child: const TransitContent(),
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