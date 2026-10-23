import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/custom_widgets.dart';
import '../../common/navigation_bar.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;
  final int selectedIndex;
  final Function(int) onNavigate;

  const PlaceholderScreen({
    Key? key,
    required this.title,
    required this.selectedIndex,
    required this.onNavigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final maxWidth = isMobile ? double.infinity : 440.0;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: BarraTPHeader(
          onMenuTap: () {},
          onLocationTap: () {},
        ),
      ),
      body: Center(
        child: SizedBox(
          width: maxWidth,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Esta página ainda está em desenvolvimento. Continue a conversar para preencher este conteúdo.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.tealDark.withOpacity(0.7), // CORRIGIDO
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                RoutePrimaryButton(
                  label: 'Voltar ao Início',
                  onPressed: () => onNavigate(0),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: selectedIndex,
      ),
    );
  }
}