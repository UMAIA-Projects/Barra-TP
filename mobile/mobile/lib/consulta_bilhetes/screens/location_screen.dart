import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../../common/navigation_bar.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int _selectedNavIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Localizações',
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
                Icons.location_on,
                size: 64,
                color: AppColors.barrateal,
              ),
              const SizedBox(height: 24),
              Text(
                'Localizações',
                style: GoogleFonts.nunitoSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.barrateal,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Veja as nossas localizações perto de si',
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
        currentIndex: 1,
      ),
    );
  }
}
