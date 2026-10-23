import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/linhas/widgets/arrival_button.dart';

class BusLineItem extends StatelessWidget {
  final String number;
  final BusVariant variant;
  final String? arrivalTime;
  final String? arrivalNumber;

  const BusLineItem({
    Key? key,
    required this.number,
    required this.variant,
    this.arrivalTime,
    this.arrivalNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color iconColor;

    switch (variant) {
      case BusVariant.yellow:
        backgroundColor = AppColors.busYellow;
        iconColor = AppColors.primary;
        break;
      case BusVariant.cyan:
        backgroundColor = AppColors.busCyan;
        iconColor = Colors.white;
        break;
      case BusVariant.green:
        backgroundColor = AppColors.busGreen;
        iconColor = AppColors.primary;
        break;
      case BusVariant.outline:
        backgroundColor = Colors.white;
        iconColor = AppColors.primary;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Bus icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: variant == BusVariant.outline
                      ? Border.all(color: AppColors.primary, width: 2)
                      : null,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 5.2,
                      offset: const Offset(5.2, 5.2),
                    ),
                  ],
                ),
                child: _buildBusIcon(iconColor),
              ),
              const SizedBox(width: 12),
              // Bus number
              Text(
                number,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          if (arrivalTime != null && arrivalNumber != null)
            ArrivalButton(
              time: arrivalTime!,
              number: arrivalNumber!,
            ),
        ],
      ),
    );
  }

  Widget _buildBusIcon(Color color) {
    return Center(
      child: SizedBox(
        width: 32,
        height: 32,
        child: CustomPaint(
          painter: BusIconPainter(color),
        ),
      ),
    );
  }
}

enum BusVariant { yellow, cyan, green, outline }

class BusIconPainter extends CustomPainter {
  final Color color;

  BusIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Simplified bus icon path
    final path = Path();
    path.moveTo(size.width * 0.2, size.height * 0.5);
    path.lineTo(size.width * 0.2, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.15,
      size.width * 0.8,
      size.height * 0.3,
    );
    path.lineTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height * 0.7);
    path.lineTo(size.width * 0.2, size.height * 0.7);
    path.close();

    canvas.drawPath(path, paint);

    // Draw wheels
    final wheelPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(size.width * 0.35, size.height * 0.75),
      size.width * 0.08,
      wheelPaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.65, size.height * 0.75),
      size.width * 0.08,
      wheelPaint,
    );
  }

  @override
  bool shouldRepaint(BusIconPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}
