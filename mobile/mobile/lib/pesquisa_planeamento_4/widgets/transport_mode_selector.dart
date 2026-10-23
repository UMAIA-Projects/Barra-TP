import 'package:flutter/material.dart';
import '../models/transport_mode.dart';
import '../config/theme.dart';

class TransportModeSelector extends StatelessWidget {
  final TransportModeType selectedMode;
  final Function(TransportModeType) onModeSelected;

  const TransportModeSelector({
    Key? key,
    required this.selectedMode,
    required this.onModeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: TransportMode.modes.map((mode) {
          final isSelected = selectedMode == mode.type;
          return _buildModeButton(
            context,
            mode,
            isSelected,
            () => onModeSelected(mode.type),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildModeButton(
    BuildContext context,
    TransportMode mode,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
              color: isSelected ? AppColors.grayMedium : AppColors.grayLight,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                mode.icon,
                size: 14,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            mode.duration,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.teakDark,
              fontSize: 10,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}
