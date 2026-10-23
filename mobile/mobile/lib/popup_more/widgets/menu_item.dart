import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String label;
  final IconData? icon;
  final String? customIconText;
  final VoidCallback onTap;

  const MenuItemWidget({
    Key? key,
    required this.label,
    this.icon,
    this.customIconText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.white.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
          child: Row(
            children: [
              SizedBox(
                width: 22,
                height: 22,
                child: customIconText != null
                    ? Center(
                        child: Text(
                          customIconText!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    : Icon(
                        icon,
                        size: 22,
                        color: Colors.white,
                      ),
              ),
              const SizedBox(width: 3),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'NunitoSans',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
