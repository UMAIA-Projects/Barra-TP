import 'package:flutter/material.dart';
import '../config/theme.dart';

class BarraButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSelected;
  final bool isPrimary;

  const BarraButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
    this.isPrimary = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isPrimary ? AppColors.teakMedium : AppColors.grayLight;
    final textColor =
        isPrimary ? Colors.white : AppColors.teakDark;

    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.grayMedium : backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.teakDark),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              label,
              style: TextStyle(
                fontFamily: AppTypography.nunitoSansFont,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class LocationMarker extends StatelessWidget {
  final Color color;
  final bool isOrigin;

  const LocationMarker({
    Key? key,
    required this.color,
    this.isOrigin = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: color, width: 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }
}

class ShadowContainer extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Border? border;
  final double elevation;

  const ShadowContainer({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius =
        const BorderRadius.all(Radius.circular(8)),
    this.border,
    this.elevation = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: border,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.1 * (elevation / 8),
            ),
            blurRadius: elevation,
            offset: Offset(0, elevation * 0.5),
          ),
        ],
      ),
      padding: padding,
      child: child,
    );
  }
}

class TransportModeCard extends StatelessWidget {
  final String id;
  final String time;
  final Widget icon;
  final bool isSelected;
  final VoidCallback onTap;

  const TransportModeCard({
    Key? key,
    required this.id,
    required this.time,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.grayMedium
                  : AppColors.grayLight,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black26),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(child: icon),
          ),
          const SizedBox(height: 4),
          Text(time, style: AppTypography.labelSmall),
        ],
      ),
    );
  }
}

class RouteStepItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isLast;

  const RouteStepItem({
    Key? key,
    required this.icon,
    required this.text,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: AppColors.teakDark),
            const SizedBox(width: 12),
            Expanded(
              child: Text(text, style: AppTypography.bodySmall),
            ),
          ],
        ),
        if (!isLast)
          Divider(
            color: AppColors.grayLight,
            thickness: 1,
            indent: 20,
          ),
      ],
    );
  }
}

class OptionChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final IconData? icon;

  const OptionChip({
    Key? key,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.grayMedium
              : AppColors.grayLight,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.teakDark),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(icon,
                    color: AppColors.teakDark, size: 16),
              ),
            Text(label, style: AppTypography.labelSmall),
          ],
        ),
      ),
    );
  }
}

class DashedDivider extends StatelessWidget {
  final Color color;
  final double dashWidth;
  final double dashHeight;
  final double spacing;

  const DashedDivider({
    Key? key,
    this.color = AppColors.grayLight,
    this.dashWidth = 4,
    this.dashHeight = 1,
    this.spacing = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: dashHeight + spacing,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: dashWidth,
            height: dashHeight,
            margin:
                EdgeInsets.symmetric(horizontal: spacing / 2),
            color: color,
          );
        },
      ),
    );
  }
}
