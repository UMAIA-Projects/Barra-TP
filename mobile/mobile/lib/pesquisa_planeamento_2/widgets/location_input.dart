import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LocationInput extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? value;
  final String iconType; // 'origin' or 'destination'
  final VoidCallback onTap;
  final TextEditingController? controller;

  const LocationInput({
    Key? key,
    required this.label,
    required this.placeholder,
    this.value,
    required this.iconType,
    required this.onTap,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          // Location Icon usando Material Icons
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: iconType == 'origin' 
                    ? AppColors.locationBlue 
                    : AppColors.locationRed,
                width: 2,
              ),
              color: Colors.white,
            ),
            child: Center(
              child: Icon(
                iconType == 'origin' ? Icons.circle : Icons.location_on,
                color: iconType == 'origin' 
                    ? AppColors.locationBlue 
                    : AppColors.locationRed,
                size: iconType == 'origin' ? 16 : 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Input Field
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.transitTeal),
                borderRadius: BorderRadius.circular(5),
                color: AppColors.transitLight,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    value ?? placeholder,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: value != null
                              ? AppColors.textPrimary
                              : AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
