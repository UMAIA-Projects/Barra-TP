import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double size;

  const UserAvatar({
    Key? key,
    this.size = 42,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _UserAvatarPainter(),
      ),
    );
  }
}

class _UserAvatarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Create a rounded rectangle background
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(size.width * 0.12),
        ),
      );

    canvas.drawPath(path, borderPaint);

    // Draw user icon (simplified)
    final headPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Head circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height * 0.35),
      size.width * 0.18,
      headPaint,
    );

    // Shoulders/body
    final bodyPath = Path()
      ..moveTo(size.width * 0.2, size.height * 0.55)
      ..quadraticBezierTo(
        size.width / 2,
        size.height * 0.75,
        size.width * 0.8,
        size.height * 0.55,
      )
      ..lineTo(size.width * 0.8, size.height)
      ..lineTo(size.width * 0.2, size.height)
      ..close();

    canvas.drawPath(bodyPath, headPaint);
  }

  @override
  bool shouldRepaint(_UserAvatarPainter oldDelegate) => false;
}
