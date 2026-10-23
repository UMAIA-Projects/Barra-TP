import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AccountInfoField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onEdit;
  final bool isMobile;

  const AccountInfoField({
    Key? key,
    required this.label,
    required this.value,
    required this.onEdit,
    this.isMobile = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: label,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' $value',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: onEdit,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  backgroundColor: AppTheme.brandPrimary,
                  elevation: 4,
                ),
                child: Text(
                  'Editar',
                  style: TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Divider(
            color: AppTheme.brandPrimary,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
