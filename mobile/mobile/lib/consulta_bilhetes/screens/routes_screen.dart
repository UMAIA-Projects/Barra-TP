import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../../common/navigation_bar.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({Key? key}) : super(key: key);

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  int _selectedNavIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Linhas',
          style: GoogleFonts.daysOne(fontSize: 28),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.route,
                size: 64,
                color: AppColors.barrateal,
              ),
              const SizedBox(height: 24),
              Text(
                'Linhas de Transporte',
                style: GoogleFonts.nunitoSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.barrateal,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Todas as nossas rotas disponíveis',
                style: GoogleFonts.nunitoSans(
                  fontSize: 14,
                  color: AppColors.barraGray,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Voltar',
                  style: GoogleFonts.nunitoSans(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(
        currentIndex: 2,
      ),
    );
  }
}
