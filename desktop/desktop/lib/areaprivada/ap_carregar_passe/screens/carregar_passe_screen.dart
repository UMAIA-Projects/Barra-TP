import 'package:flutter/material.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/areaprivada/areaprivada_1/widgets/sidebar_navigation_ap.dart';
import 'package:desktop/areaprivada/ap_carregar_passe/widgets/form_section.dart';
import 'package:desktop/areaprivada/ap_carregar_passe/widgets/amounts_section.dart';

class CarregarPasseScreen extends StatefulWidget {
  const CarregarPasseScreen({Key? key}) : super(key: key);

  @override
  State<CarregarPasseScreen> createState() => _CarregarPasseScreenState();
}

class _CarregarPasseScreenState extends State<CarregarPasseScreen> {
  String selectedAmount = '';

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      activePage: 'Passe Digital',
      showSearchBar: false,
      customSidebar: SidebarNavigationAP(activePage: 'Passe Digital'),
      child: MainContent(
        selectedAmount: selectedAmount,
        onAmountSelected: (amount) {
          setState(() => selectedAmount = amount);
        },
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  final String selectedAmount;
  final Function(String) onAmountSelected;

  const MainContent({
    super.key,
    required this.selectedAmount,
    required this.onAmountSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width < 768 ? 16 : 32,
        right: MediaQuery.of(context).size.width < 768 ? 16 : 32,
        top: 0,
        bottom: 40,
      ),
      child: isMobile
          ? Column(
              children: [
                const FormSection(),
                const SizedBox(height: 24),
                AmountsSection(
                  selectedAmount: selectedAmount,
                  onAmountSelected: onAmountSelected,
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: const FormSection(),
                ),
                const SizedBox(width: 24),
                SizedBox(
                  width: 340,
                  child: AmountsSection(
                    selectedAmount: selectedAmount,
                    onAmountSelected: onAmountSelected,
                  ),
                ),
              ],
            ),
    );
  }
}