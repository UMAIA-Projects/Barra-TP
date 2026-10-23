import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/responsive_utils.dart';
import 'package:desktop/Consulta/Pesquisa/widgets/search_form_widget.dart';
import 'package:desktop/Consulta/Pesquisa/widgets/filter_bar_widget.dart';
import 'package:desktop/Consulta/Pesquisa/widgets/trip_results_widget.dart';
import 'package:desktop/Consulta/Pesquisa/widgets/shopping_cart_widget.dart';

class PesquisaScreen extends StatelessWidget {
  const PesquisaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return BaseScreen(
      activePage: 'Consulta',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Search form
          SearchFormWidget(),
          SizedBox(height: responsive.spacing(24)),
          
          // Title and search button
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: responsive.spacing(36)),
                    Text(
                      'Viagens Disponiveis',
                      style: GoogleFonts.nunitoSans(
                        color: AppColors.barraTeal,
                        fontSize: responsive.scaleFontSize(45),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                  padding: EdgeInsets.only(top: responsive.spacing(8)),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(responsive.borderRadius(12)),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsive.spacing(24),
                          vertical: responsive.spacing(12),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.barraTeal,
                          borderRadius: BorderRadius.circular(responsive.borderRadius(12)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Pesquisa',
                              style: GoogleFonts.nunitoSans(
                                color: Colors.white,
                                fontSize: responsive.scaleFontSize(18),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(width: responsive.spacing(8)),
                            Icon(
                              Icons.search,
                              color: Colors.white,
                              size: responsive.iconSize(18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          
          SizedBox(height: responsive.spacing(8)),
          Text(
            'Personalizar filtros',
            style: GoogleFonts.nunitoSans(
              fontSize: responsive.scaleFontSize(28),
              fontWeight: FontWeight.w600,
              color: AppColors.barraTeal,
            ),
          ),
          SizedBox(height: responsive.spacing(32)),
          
          // Filter bar
          FilterBarWidget(),
          SizedBox(height: responsive.spacing(32)),
          
          // Results and cart
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 77,
                child: TripResultsWidget(),
              ),
              SizedBox(width: responsive.spacing(24)),
              Expanded(
                flex: 23,
                child: ShoppingCartWidget(),
              ),
            ],
          ),
          SizedBox(height: responsive.spacing(120)),
        ],
      ),
    );
  }
}