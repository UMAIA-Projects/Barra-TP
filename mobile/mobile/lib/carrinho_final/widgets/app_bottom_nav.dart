import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../../common/navigation_helper.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onItemTapped;

  const AppBottomNav({
    Key? key,
    this.currentIndex = 0,
    this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.primary,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        onItemTapped?.call(index);
        NavigationHelper.navigateToPage(context, index);
      },
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home, size: 28),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.location_on, size: 28),
          label: 'Localização',
        ),
        BottomNavigationBarItem(
          icon: _customRoutesIcon(),
          label: 'Linhas',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person, size: 28),
          label: 'Perfil',
        ),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedFontSize: 12,
      unselectedFontSize: 10,
    );
  }

  Widget _customRoutesIcon() {
    return CustomPaint(
      painter: RoutesIconPainter(),
      size: const Size(24, 24),
    );
  }
}

class RoutesIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // Draw two parallel horizontal lines representing routes
    canvas.drawLine(
      Offset(2, size.height * 0.3),
      Offset(size.width - 2, size.height * 0.3),
      paint,
    );
    canvas.drawLine(
      Offset(2, size.height * 0.7),
      Offset(size.width - 2, size.height * 0.7),
      paint,
    );

    // Draw connecting vertical lines
    canvas.drawLine(
      Offset(size.width * 0.3, size.height * 0.3),
      Offset(size.width * 0.3, size.height * 0.7),
      paint,
    );
    canvas.drawLine(
      Offset(size.width * 0.7, size.height * 0.3),
      Offset(size.width * 0.7, size.height * 0.7),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
