import 'package:flutter/material.dart';
import 'screens/itinerary_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BARRA TP',
      theme: AppTheme.lightTheme,
      home: const MainNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 448),
          child: Scaffold(
            body: _buildBody(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              backgroundColor: const Color(0xFF365F67),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: _buildHomeIcon(),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _buildLocationIcon(),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _buildLinesIcon(),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: _buildProfileIcon(),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const ItineraryScreen();
      case 1:
        return const PlaceholderScreen(title: 'Localização');
      case 2:
        return const PlaceholderScreen(title: 'Linhas');
      case 3:
        return const PlaceholderScreen(title: 'Perfil');
      default:
        return const ItineraryScreen();
    }
  }

  Widget _buildHomeIcon() {
    return SizedBox(
      width: 50,
      height: 47,
      child: CustomPaint(
        painter: HomeIconPainter(),
      ),
    );
  }

  Widget _buildLocationIcon() {
    return SizedBox(
      width: 42,
      height: 43,
      child: CustomPaint(
        painter: LocationIconPainter(),
      ),
    );
  }

  Widget _buildLinesIcon() {
    return SizedBox(
      width: 38,
      height: 38,
      child: CustomPaint(
        painter: LinesIconPainter(),
      ),
    );
  }

  Widget _buildProfileIcon() {
    return SizedBox(
      width: 40,
      height: 40,
      child: CustomPaint(
        painter: ProfileIconPainter(),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF365F67),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              '$title - Coming Soon',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.79);
    path.lineTo(size.width * 0.375, size.height * 0.79);
    path.lineTo(size.width * 0.375, size.height * 0.54);
    path.lineTo(size.width * 0.625, size.height * 0.54);
    path.lineTo(size.width * 0.625, size.height * 0.79);
    path.lineTo(size.width * 0.75, size.height * 0.79);
    path.lineTo(size.width * 0.75, size.height * 0.42);
    path.lineTo(size.width * 0.5, size.height * 0.23);
    path.lineTo(size.width * 0.25, size.height * 0.42);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HomeIconPainter oldDelegate) => false;
}

class LocationIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    canvas.drawCircle(Offset(centerX, centerY * 0.5), size.width * 0.15, paint);
    
    final path = Path();
    path.moveTo(centerX, centerY * 0.5);
    path.quadraticBezierTo(centerX + size.width * 0.3, centerY, centerX, centerY * 1.8);
    path.quadraticBezierTo(centerX - size.width * 0.3, centerY, centerX, centerY * 0.5);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(LocationIconPainter oldDelegate) => false;
}

class LinesIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.1, size.height * 0.4, size.width * 0.8, size.height * 0.2),
      paint,
    );
  }

  @override
  bool shouldRepaint(LinesIconPainter oldDelegate) => false;
}

class ProfileIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width / 2, size.height * 0.3), size.width * 0.2, paint);
    
    final path = Path();
    path.moveTo(0, size.height * 0.7);
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(size.width / 2, size.height * 0.5, size.width, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.7);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(ProfileIconPainter oldDelegate) => false;
}
