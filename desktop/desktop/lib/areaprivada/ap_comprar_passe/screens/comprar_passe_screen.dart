import 'package:flutter/material.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/areaprivada/areaprivada_1/widgets/sidebar_navigation_ap.dart';
import 'package:desktop/areaprivada/ap_comprar_passe/widgets/pass_form_widget.dart';
import 'package:desktop/areaprivada/ap_comprar_passe/widgets/pass_types_widget.dart';

class ComprarPasseScreen extends StatefulWidget {
  const ComprarPasseScreen({Key? key}) : super(key: key);

  @override
  State<ComprarPasseScreen> createState() => _ComprarPasseScreenState();
}

class _ComprarPasseScreenState extends State<ComprarPasseScreen> {
  String? selectedPass;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      activePage: 'Passe Digital',
      showSearchBar: false,
      customSidebar: SidebarNavigationAP(activePage: 'Passe Digital'),
      child: MainContent(
        selectedPass: selectedPass,
        onPassSelected: (pass) {
          setState(() {
            selectedPass = selectedPass == pass ? null : pass;
          });
        },
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  final String? selectedPass;
  final Function(String?) onPassSelected;

  const MainContent({
    super.key,
    required this.selectedPass,
    required this.onPassSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width < 768 ? 16 : 32,
        right: MediaQuery.of(context).size.width < 768 ? 16 : 32,
        top: 0,
        bottom: 50,
      ),
      child: isMobile
          ? Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(40),
                  child: PassFormWidget(selectedPass: selectedPass),
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(32),
                  child: PassTypesWidget(
                    selectedPass: selectedPass,
                    onPassSelected: onPassSelected,
                  ),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(40),
                    child: PassFormWidget(selectedPass: selectedPass),
                  ),
                ),
                const SizedBox(width: 24),
                SizedBox(
                  width: 384,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(32),
                    child: PassTypesWidget(
                      selectedPass: selectedPass,
                      onPassSelected: onPassSelected,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
