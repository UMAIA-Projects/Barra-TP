import 'package:flutter/material.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/constants/responsive_utils.dart';
import 'package:desktop/Consulta/HomePage/widgets/search_form.dart';
import 'package:desktop/Consulta/HomePage/widgets/travel_offers_grid.dart';
import 'package:desktop/Consulta/HomePage/widgets/promotion_banner.dart';
import 'package:desktop/Consulta/HomePage/widgets/social_media_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return BaseScreen(
      activePage: 'Consulta',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Form
          SearchForm(),
          SizedBox(height: responsive.spacing(48)),

          // Travel Offers Section
          TravelOffersGrid(),
          SizedBox(height: responsive.spacing(48)),

          // Promotion Banner
          PromotionBanner(),
          SizedBox(height: responsive.spacing(8)),

          // Social Media Section
          Transform.translate(
            offset: Offset(0, responsive.spacing(30)),
            child: SocialSectionWidget(),
          ),
          SizedBox(height: responsive.spacing(18)),

          // Espaço extra para garantir que o footer não cubra os nomes das redes sociais
          SizedBox(height: responsive.spacing(80)),
        ],
      ),
    );
  }
}