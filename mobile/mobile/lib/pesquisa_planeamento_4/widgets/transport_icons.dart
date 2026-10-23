import 'package:flutter/material.dart';

class CarIcon extends StatelessWidget {
  final Color color;
  final double size;

  const CarIcon({
    Key? key,
    this.color = Colors.white,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _CarIconPainter(color),
    );
  }
}

class _CarIconPainter extends CustomPainter {
  final Color color;

  _CarIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    // Simplified car icon
    final path = Path();
    path.moveTo(size.width * 0.25, size.height * 0.5);
    path.lineTo(size.width * 0.75, size.height * 0.5);
    path.lineTo(size.width * 0.85, size.height * 0.65);
    path.lineTo(size.width * 0.15, size.height * 0.65);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MetroIcon extends StatelessWidget {
  final Color color;
  final double size;

  const MetroIcon({
    Key? key,
    this.color = Colors.white,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.train,
      color: color,
      size: size,
    );
  }
}

class WalkIcon extends StatelessWidget {
  final Color color;
  final double size;

  const WalkIcon({
    Key? key,
    this.color = Colors.white,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.directions_walk,
      color: color,
      size: size,
    );
  }
}

class BikeIcon extends StatelessWidget {
  final Color color;
  final double size;

  const BikeIcon({
    Key? key,
    this.color = Colors.white,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.two_wheeler,
      color: color,
      size: size,
    );
  }
}

class RouteIcon extends StatelessWidget {
  final Color color;
  final double size;

  const RouteIcon({
    Key? key,
    this.color = Colors.white,
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.directions,
      color: color,
      size: size,
    );
  }
}
