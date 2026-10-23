import 'package:flutter/material.dart';
import '../widgets/profile_section.dart';
import '../widgets/menu_section.dart';
import '../widgets/deals_carousel.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';

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
          constraints: BoxConstraints(
            maxWidth: isMobile ? double.infinity : 600,
          ),
          decoration: BoxDecoration(
            border: isMobile
                ? null
                : Border(
                    left: BorderSide(
                      color: const Color(0xFF365F67),
                      width: 1,
                    ),
                    right: BorderSide(
                      color: const Color(0xFF365F67),
                      width: 1,
                    ),
                  ),
            boxShadow: isMobile
                ? null
                : [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black.withValues(alpha: 0.25),
                    ),
                  ],
          ),
          child: SingleChildScrollView(
            child: Column(
                children: [
                  const HeaderApp(),
                  const ProfileSection(),
                  const MenuSection(),
                  DealsCarousel(),
                  const SizedBox(height: 60),
                ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(
        currentIndex: 3,
      ),
    );
  }
}
