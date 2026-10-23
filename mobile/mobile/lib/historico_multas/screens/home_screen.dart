import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/fine_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/breadcrumb.dart';
import '../widgets/fine_card.dart';
import '../widgets/section_header.dart';
import '../widgets/summary.dart';
import '../widgets/tab_navigation.dart';
import '../../common/navigation_bar.dart';
import '../../common/header_app.dart';
import '../../historico_viagens/screens/home_screen.dart' as HistoricoViagensScreen;
import '../../historico_viagens/providers/trip_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidth = isMobile ? screenWidth : 440.0;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Container(
            width: maxWidth,
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.brandTeal),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Color.fromARGB(64, 0, 0, 0),
                ),
              ],
              color: AppTheme.backgroundColor,
            ),
            child: Column(
              children: [
                const HeaderApp(),
                const BreadcrumbWidget(),
                const SectionHeaderWidget(),
                Expanded(
                  child: Consumer<FineProvider>(
                    builder: (context, provider, _) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                        TabNavigationWidget(
                          activeTab: provider.activeTab,
                          onTabChange: (tab) {
                            if (tab == 'viagens') {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ChangeNotifierProvider(
                                    create: (_) => TripProvider(),
                                    child: const HistoricoViagensScreen.HomeScreen(),
                                  ),
                                ),
                              );
                            } else {
                              provider.setActiveTab(tab);
                            }
                          },
                        ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: provider.activeTab == 'multas'
                                  ? _buildMultasContent(context, provider)
                                  : _buildViagensContent(context),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: _selectedNavIndex,
        onTabSelectedOverride: (index) {
          setState(() {
            _selectedNavIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildMultasContent(BuildContext context, FineProvider provider) {
    return Column(
      children: [
        ...provider.fines.asMap().entries.map(
          (entry) => FineCardWidget(fine: entry.value),
        ),
        SummaryWidget(
          totalFines: provider.totalFines,
          paidCount: provider.paidCount,
          unpaidCount: provider.unpaidCount,
          totalAmount: '${provider.totalAmount.toStringAsFixed(0)}€',
          accountStatus: 'Leve',
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildViagensContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Text(
          'Conteúdo de Viagens será exibido aqui',
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
