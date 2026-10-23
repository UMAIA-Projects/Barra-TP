import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';
import '../widgets/pass_section.dart';
import '../../comprar_passe/screens/home_screen.dart' as ComprarPasse;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Center(
        child: Container(
          width: isMobile ? double.infinity : 440,
          constraints: const BoxConstraints(maxHeight: 956),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.brandTeal),
            borderRadius: isMobile ? BorderRadius.zero : BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // Header
              const HeaderApp(),
              // Subheader - Área Privada
              Container(
                height: 34,
                color: Color(0xFF407079),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.chevron_left, color: Colors.white),
                      iconSize: 24,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 20,
                        color: AppColors.brandTeal,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Área Privada',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Tab Navigation
              Container(
                height: 50,
                color: Color(0xFF407079),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.brandTeal,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Passe Digital',
                          style: TextStyle(
                            fontFamily: 'DaysOne',
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.brandTeal,
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          'Comprar Passe',
                          style: TextStyle(
                            fontFamily: 'DaysOne',
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Scrollable Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Passe Ativo Section
                      const PassSection(
                        title: 'Passe Ativo',
                        showDivider: true,
                        children: [
                          SizedBox(height: 16),
                          PassCard(),
                          SizedBox(height: 16),
                          PassActionButton(
                            label: 'Renovar Passe',
                          ),
                        ],
                      ),
                      // Alterar Passe Section
                      PassSection(
                        title: 'Alterar Passe',
                        showDivider: true,
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            'A sua conta tem acesso aos passes:\nPasse Animália\nPasse Jovem\nPasse Inclusivo',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 24),
                          const PassActionButton(
                            label: 'Alterar Passe',
                          ),
                        ],
                      ),
                      // Carregue o seu passe Section
                      PassSection(
                        title: 'Carregue o seu passe',
                        showDivider: false,
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            'Garanta que nunca falhe uma viagem\nCarregamentos mínimos: 5€',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Ao carregar valores adicionais pode ter direito a promoções excecionais. Estamos a fazer um sorteio! 1 pessoa que carregar mais que 5 € pode ganhar até 50.000€ em viagens com o BARRA TP.',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 20),
                          const PassActionButton(
                            label: 'Carregar Passe',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Bottom Navigation
              const CustomBottomBar(currentIndex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

// Pass Card Widget
class PassCard extends StatelessWidget {
  const PassCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 6,
                offset: const Offset(6, 6),
              ),
            ],
          ),
          child: Image.network(
            'https://api.builder.io/api/v1/image/assets/TEMP/ac2b9ab660710a460860bc6a5845ce3a67a2fd72?width=594',
            width: double.infinity,
            height: 191,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// Pass Action Button Widget
class PassActionButton extends StatelessWidget {
  final String label;

  const PassActionButton({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.brandTeal,
          elevation: 4,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
