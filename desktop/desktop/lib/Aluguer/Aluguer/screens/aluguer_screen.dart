import 'package:flutter/material.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/constants/responsive_utils.dart';
import 'package:desktop/Aluguer/Aluguer/models/car.dart';
import 'package:desktop/Aluguer/Aluguer/widgets/car_card.dart';
import 'package:desktop/Aluguer/Aluguer/widgets/filters_panel.dart';

class AluguerScreen extends StatelessWidget {
  const AluguerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return BaseScreen(
      activePage: 'Aluguer',
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(
              left: responsive.scaleWidth(32),
              right: responsive.scaleWidth(340), // Espaço para filtros (280 + margem)
              top: responsive.scaleHeight(60),
              bottom: responsive.scaleHeight(80),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...sampleCars.map((car) => CarCard(car: car)).toList(),
              ],
            ),
          ),
          // Painel de filtros à direita
          Positioned(
            top: responsive.scaleHeight(216),
            right: responsive.scaleWidth(16),
            bottom: responsive.scaleHeight(80),
            child: SingleChildScrollView(
              child: const FilterPanel(),
            ),
          ),
        ],
      ),
    );
  }
}