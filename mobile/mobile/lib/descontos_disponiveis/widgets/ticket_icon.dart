import 'package:flutter/material.dart';

class TicketIcon extends StatelessWidget {
  final Color color;
  final double size;

  const TicketIcon({
    Key? key,
    required this.color,
    this.size = 29,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _TicketPainter(color),
      ),
    );
  }
}

class _TicketPainter extends CustomPainter {
  final Color color;

  _TicketPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Simplified ticket icon - a stylized rectangular ticket shape
    final path = Path();
    
    // Main ticket body
    path.moveTo(size.width * 0.2, size.height * 0.15);
    path.lineTo(size.width * 0.8, size.height * 0.15);
    path.lineTo(size.width * 0.8, size.height * 0.85);
    path.lineTo(size.width * 0.2, size.height * 0.85);
    path.close();

    canvas.drawPath(path, paint);

    // Inner decoration lines
    final linePaint = Paint()
      ..color = color.withValues(alpha: 0.7)
      ..strokeWidth = size.width * 0.05;

    canvas.drawLine(
      Offset(size.width * 0.35, size.height * 0.3),
      Offset(size.width * 0.65, size.height * 0.5),
      linePaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.65, size.height * 0.3),
      Offset(size.width * 0.35, size.height * 0.5),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(_TicketPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
