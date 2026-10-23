import 'package:flutter/material.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/constants/colors.dart';

class AlertasScreen extends StatelessWidget {
  const AlertasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      activePage: 'Alertas',
      showSearchBar: false,
      child: const MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        top: 0,
        bottom: 0,
      ),
      child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildAlertsSection(context),
                ),
                const SizedBox(width: 24),
                SizedBox(
                  width: 340,
                  child: _buildNovidades(context),
                ),
              ],
            ),
    );
  }

  Widget _buildAlertsSection(BuildContext context) {
    final alerts = [
      {
        'date': '4 de novembro de 2025',
        'title': 'Atrasos nas linhas ferroviárias do Norte:',
        'description':
            'Chuvas intensas e vento forte estão a causar atrasos de 10 a 20 minutos nos serviços Porto–Aveiro e Porto–Braga.',
        'highlight': 'Atualização em tempo real disponível na app.',
      },
      {
        'date': '10 de setembro de 2025',
        'title': 'Circulação suspensa entre Senhora da Hora e Casa da Música:',
        'description':
            'Devido a avaria no sistema elétrico, a circulação está interrompida temporariamente.',
        'highlight': 'Previsão de retoma: 11h30',
      },
      {
        'date': '1 de agosto de 2025',
        'title': '"Volta a Portugal em Bicicleta":',
        'description':
            'Condiciona diferentes locais em relação a trânsito: verifique se a sua cidade vai incluir alguma restrição às ruas.',
        'highlight': 'Datas condicionadas: 6 a 17 de agosto',
      },
    ];

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Alertas Recentes',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.barraTeal,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 4,
            color: AppColors.barraTeal,
            margin: const EdgeInsets.only(bottom: 32),
          ),
          ...alerts.asMap().entries.map((entry) {
            final index = entry.key;
            final alert = entry.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (index > 0) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Container(
                      height: 1,
                      color: AppColors.barraTeal.withValues(alpha: 0.4),
                    ),
                  ),
                ],
                Text(
                  alert['date']!,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.barraTeal,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: alert['title'],
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.barraTeal,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      TextSpan(
                        text: ' ${alert['description']} ',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.barraTeal,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      TextSpan(
                        text: alert['highlight'],
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.barraTeal,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildNovidades(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Novidades',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: AppColors.barraTeal,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 4,
            width: 100,
            color: AppColors.barraTeal,
          ),
          const SizedBox(height: 32),
          _buildNewsCard(
            context,
            title: 'Pacote Família',
            description:
                'Economize com o Pacote Família, e consigua passes mensais para toda a sua família.',
            imageUrl:
                'https://api.builder.io/api/v1/image/assets/TEMP/dc11acbb44ba42246691780b08b746b1805217f8?width=556',
          ),
          const SizedBox(height: 24),
          _buildNewsCard(
            context,
            title: 'Boas Festas',
            description:
                'Do dia 20/12 até 10/01 oferecemos descontos natalícios em quase todas as nossas viagens.',
            imageUrl:
                'https://api.builder.io/api/v1/image/assets/TEMP/c5d7bf58fe452199d6a51deb8b77d6a82ceb74f3?width=558',
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(
    BuildContext context, {
    required String title,
    required String description,
    required String imageUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.barraTeal.withValues(alpha: 0.8), AppColors.barraTeal],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 140,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                        height: 1.4,
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