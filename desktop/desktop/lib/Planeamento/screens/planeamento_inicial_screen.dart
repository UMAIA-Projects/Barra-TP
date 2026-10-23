import 'package:flutter/material.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/constants/responsive_utils.dart';
import 'package:desktop/constants/searchbar_widget.dart';
import 'package:desktop/Planeamento/widgets/planning_form.dart';
import 'package:desktop/Planeamento/widgets/filters_panel.dart';

class PlaneamentoInicialScreen extends StatelessWidget {
  const PlaneamentoInicialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return BaseScreen(
      activePage: 'Planeamento',
      showSearchBar: true,
      customSearchBar: const SearchBarWidget(),
      disableScroll: true,
      backgroundImage: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://api.builder.io/api/v1/image/assets/TEMP/45a638374d6638a86dd929d91b8cf20741813c24?width=3602',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 76,
                    child: Center(
                      child: Column(
                        children: [
                          PlanningFormWidget(),
                          SizedBox(height: responsive.spacing(32)),
                          SizedBox(height: responsive.spacing(48)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: responsive.spacing(20)),
                  Expanded(
                    flex: 24,
                    child: Column(
                      children: [
                        SizedBox(height: responsive.spacing(20)),
                        FiltersPanelWidget(),
                      ],
                    ),
                  ),
                ],
          );
        },
      ),
    );
  }
}