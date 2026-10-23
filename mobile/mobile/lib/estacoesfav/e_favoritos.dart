import 'package:flutter/material.dart';
import '../common/navigation_bar.dart';
import 'widgets/search_bar.dart';
import 'widgets/map_view.dart';
import 'widgets/station_toggle.dart';
import 'widgets/station_list.dart';
import '../common/header_app.dart';

class EFavoritos extends StatelessWidget {
  const EFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Header
            const HeaderApp(),
            
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Search bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: const CustomSearchBar(),
                    ),
                    
                    // Map view
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: const MapView(),
                    ),
                    
                    // Station toggle
                    const StationToggle(),
                    
                    // Station list
                    const StationList(),
                    
                    // Bottom spacing for navigation bar
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 1),
    );
  }
}