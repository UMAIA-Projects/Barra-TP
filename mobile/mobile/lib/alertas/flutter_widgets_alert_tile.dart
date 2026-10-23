import 'package:flutter/material.dart';
import 'flutter_models_alert.dart';
import 'flutter_constants_colors.dart';

class AlertTile extends StatelessWidget {
  final Alert alert;
  final bool isLast;

  const AlertTile({
    Key? key,
    required this.alert,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: 4,
          ),
          child: Text(
            alert.date,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.tealdark,
              fontWeight: FontWeight.bold,
              fontSize: isMobile ? 11 : 12,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: 8,
          ),
          child: RichText(
            text: TextSpan(
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.tealdark,
                fontSize: isMobile ? 10 : 11,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: alert.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' ${alert.description}',
                  style: const TextStyle(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
        if (!isLast)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 24,
              vertical: 12,
            ),
            child: Container(
              height: 2,
              color: AppColors.tealdark,
            ),
          )
        else
          SizedBox(height: isMobile ? 16 : 24),
      ],
    );
  }
}
