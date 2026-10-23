import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/linhas/widgets/arrival_button.dart';

class TrainLineItem extends StatelessWidget {
  final String name;
  final TrainColor color;
  final bool highlighted;
  final String? arrivalTime;
  final String? arrivalNumber;

  const TrainLineItem({
    Key? key,
    required this.name,
    required this.color,
    this.highlighted = false,
    this.arrivalTime,
    this.arrivalNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = _getTrainColor(color);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Train icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: highlighted
                      ? [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 5.2,
                            offset: const Offset(5.2, 5.2),
                          ),
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 5.2,
                            offset: const Offset(5.2, 5.2),
                          ),
                        ]
                      : [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 5.2,
                            offset: const Offset(5.2, 5.2),
                          ),
                        ],
                ),
                child: _buildTrainIcon(),
              ),
              const SizedBox(width: 12),
              // Train name
              Text(
                name,
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

  Widget _buildTrainIcon() {
    return Center(
      child: SizedBox(
        width: 26,
        height: 29,
        child: CustomPaint(
          painter: TrainIconPainter(),
        ),
      ),
    );
  }

  Color _getTrainColor(TrainColor color) {
    switch (color) {
      case TrainColor.red:
        return AppColors.trainRed;
      case TrainColor.orange:
        return AppColors.trainOrange;
      case TrainColor.yellow:
        return AppColors.trainYellow;
      case TrainColor.green:
        return AppColors.trainGreen;
      case TrainColor.cyan:
        return AppColors.trainCyan;
      case TrainColor.magenta:
        return AppColors.trainMagenta;
      case TrainColor.purple:
        return AppColors.trainPurple;
      case TrainColor.blue:
        return AppColors.trainBlue;
    }
  }
}

enum TrainColor { red, orange, yellow, green, cyan, magenta, purple, blue }

class TrainIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Train body
    final bodyPath = Path();
    bodyPath.moveTo(size.width * 0.1, size.height * 0.4);
    bodyPath.lineTo(size.width * 0.1, size.height * 0.2);
    bodyPath.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.05,
      size.width * 0.9,
      size.height * 0.2,
    );
    bodyPath.lineTo(size.width * 0.9, size.height * 0.4);
    bodyPath.lineTo(size.width * 0.9, size.height * 0.65);
    bodyPath.lineTo(size.width * 0.1, size.height * 0.65);
    bodyPath.close();

    canvas.drawPath(bodyPath, paint);

    // Wheels
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.8),
      size.width * 0.08,
      paint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.7, size.height * 0.8),
      size.width * 0.08,
      paint,
    );
  }

  @override
  bool shouldRepaint(TrainIconPainter oldDelegate) => false;
}