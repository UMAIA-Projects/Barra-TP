import 'package:flutter/material.dart';
import '../models/car.dart';
import '../widgets/car_card.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Car> cars = [
    Car(
      id: 1,
      category: 'Carro Médio',
      name: 'Fiat Panda',
      image:
          'https://api.builder.io/api/v1/image/assets/TEMP/dbcc9e463802c42c076177087394e2fd676de2ad?width=452',
      rating: 7.6,
      seats: 5,
      transmission: 'Manual',
      largeBags: 1,
      smallBags: 1,
      price: 80,
      days: 3,
    ),
    Car(
      id: 2,
      category: 'SUV',
      name: 'BYD Seal U',
      image:
          'https://api.builder.io/api/v1/image/assets/TEMP/a3535fd63086fc0b44c123db045152780733ba07?width=452',
      rating: 8.8,
      seats: 5,
      transmission: 'Automático',
      largeBags: 3,
      smallBags: 1,
      price: 165,
      days: 3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
  children: [
    const HeaderApp(), // ✅ HEADER COMMON

    Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildFilterBar(),
            _buildCarListings(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    ),
  ],
),

bottomNavigationBar: const CustomBottomBar(currentIndex: 2),
    );
  }

  Widget _buildFilterBar() {
    return Container(
      color: const Color(0xFF365F67),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          Row(
            children: [
              const Icon(Icons.arrow_back, color: Colors.white, size: 24),
              const SizedBox(width: 8),
              const Text(
                'Retornar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NunitoSans',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Filter badge
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF365F67),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Aluguer',
              style: TextStyle(
                fontFamily: 'DaysOne',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarListings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: List.generate(
          cars.length,
          (index) => Column(
            children: [
              CarCard(car: cars[index]),
              if (index < cars.length - 1)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Divider(
                    color: const Color(0xFF365F67),
                    height: 1,
                    thickness: 1,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE3E3E3)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const double spacing = 8;
    final double lineWidth = size.width;
    final double lineHeight = 2;

    // Top line
    canvas.drawRect(
      Rect.fromLTWH(0, 2, lineWidth, lineHeight),
      paint,
    );
    // Middle line
    canvas.drawRect(
      Rect.fromLTWH(0, (size.height - lineHeight) / 2, lineWidth, lineHeight),
      paint,
    );
    // Bottom line
    canvas.drawRect(
      Rect.fromLTWH(0, size.height - lineHeight - 2, lineWidth, lineHeight),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class LocationIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Draw pin marker - simplified version
    path.addOval(Rect.fromCircle(center: Offset(centerX, centerY - 5), radius: 5));
    path.addPolygon(
      [
        Offset(centerX - 8, centerY + 5),
        Offset(centerX, centerY + 15),
        Offset(centerX + 8, centerY + 5),
      ],
      true,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
