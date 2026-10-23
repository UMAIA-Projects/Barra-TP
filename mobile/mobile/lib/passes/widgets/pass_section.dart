import 'package:flutter/material.dart';
import '../config/theme.dart';

class PassSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool showDivider;

  const PassSection({
    Key? key,
    required this.title,
    required this.children,
    this.showDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.brandTeal,
                width: 4,
              ),
              bottom: showDivider
                  ? BorderSide(
                      color: AppColors.brandTeal,
                      width: 4,
                    )
                  : BorderSide.none,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 6),
              Container(
                height: 1,
                width: title == 'Carregue o seu passe' ? 173 : 123,
                color: AppColors.brandTeal,
              ),
              ...children,
            ],
          ),
        ),
      ],
    );
  }
}
