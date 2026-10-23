import 'package:flutter/material.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';
import '../widgets/direction_bar.dart';
import '../widgets/metro_line.dart';
import '../theme/colors.dart';

class MetroScreen extends StatefulWidget {
  const MetroScreen({Key? key}) : super(key: key);

  @override
  State<MetroScreen> createState() => _MetroScreenState();
}

class _MetroScreenState extends State<MetroScreen> {
  int _selectedNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final maxWidth = isMobile ? double.infinity : 500.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: maxWidth,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.metroTeal, width: 1),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                const HeaderApp(),
                const DirectionBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MetroLine(),
                    ),
                  ),
                ),
                CustomBottomBar(
                  currentIndex: 3,
                  onTabSelectedOverride: (index) {
                    setState(() => _selectedNavIndex = index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 2),
    );
  }
}
