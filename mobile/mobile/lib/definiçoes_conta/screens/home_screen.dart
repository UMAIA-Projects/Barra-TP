import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';
import '../../common/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeaderApp(),
            Icon(
              Icons.home,
              size: 64,
              color: AppTheme.brandPrimary,
            ),
            const SizedBox(height: 16),
            const Text(
              'Bem-vindo à BARRA TP',
              style: TextStyle(
                fontFamily: 'DaysOne',
                fontSize: 24,
                color: AppTheme.brandPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Home Screen Placeholder',
              style: TextStyle(
                fontFamily: 'NunitoSans',
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const Footer(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(
        currentIndex: 3,
      ),
    );
  }
}
