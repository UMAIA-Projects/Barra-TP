import 'package:flutter/material.dart';
import '../app/theme/app_theme.dart';
import '../models/route_model.dart';

class RouteResultCard extends StatelessWidget {
  final RouteModel route;

  const RouteResultCard({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Wrap(
                spacing: 4,
                runSpacing: 4,
                children: route.segments.map((segment) {
                  if (segment == 'walk') {
                    return _WalkingIcon();
                  } else if (segment.startsWith('bus_')) {
                    final busNumber = segment.replaceFirst('bus_', '');
                    return _BusSegment(busNumber: busNumber);
                  } else if (segment.startsWith('metro_')) {
                    final line = segment.replaceFirst('metro_', '').toUpperCase();
                    return _MetroSegment(line: line);
                  }
                  return _ArrowSeparator();
                }).toList(),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              route.displayTime,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 8,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _WalkingIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: CustomPaint(
        painter: WalkingIconPainter(),
      ),
    );
  }
}

class WalkingIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    // Simple walking stick figure
    canvas.drawCircle(const Offset(6, 2), 1.5, paint..style = PaintingStyle.fill);
    canvas.drawLine(const Offset(6, 3.5), const Offset(6, 7), paint..style = PaintingStyle.stroke);
    canvas.drawLine(const Offset(6, 5), const Offset(3, 8), paint..style = PaintingStyle.stroke);
    canvas.drawLine(const Offset(6, 5), const Offset(9, 8), paint..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(WalkingIconPainter oldDelegate) => false;
}

class _ArrowSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 12,
      height: 12,
      child: Icon(
        Icons.arrow_forward,
        size: 12,
        color: AppColors.primary,
      ),
    );
  }
}

class _BusSegment extends StatelessWidget {
  final String busNumber;

  const _BusSegment({required this.busNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 2,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 12,
            height: 12,
            child: CustomPaint(
              painter: BusIconPainter(),
            ),
          ),
          const SizedBox(width: 2),
          Text(
            busNumber,
            style: const TextStyle(
              fontSize: 6,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class BusIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 1;

    // Simple bus icon
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(0, 1, 12, 8),
        const Radius.circular(1),
      ),
      paint,
    );
    canvas.drawCircle(const Offset(2, 10), 1, paint..style = PaintingStyle.fill);
    canvas.drawCircle(const Offset(10, 10), 1, paint..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(BusIconPainter oldDelegate) => false;
}

class _MetroSegment extends StatelessWidget {
  final String line;

  const _MetroSegment({required this.line});

  @override
  Widget build(BuildContext context) {
    final isLineC = line == 'C';
    final color = isLineC ? AppColors.metroGreen : AppColors.metroPurple;

    return SizedBox(
      width: 15,
      height: 15,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          Center(
            child: Text(
              line,
              style: const TextStyle(
                fontSize: 6,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
