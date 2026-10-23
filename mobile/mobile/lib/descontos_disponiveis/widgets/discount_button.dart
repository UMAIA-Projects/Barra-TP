import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/discount.dart';
import 'ticket_icon.dart';

class DiscountButton extends StatefulWidget {
  final Discount discount;
  final VoidCallback? onPressed;
  final int animationDelay;

  const DiscountButton({
    Key? key,
    required this.discount,
    this.onPressed,
    this.animationDelay = 0,
  }) : super(key: key);

  @override
  State<DiscountButton> createState() => _DiscountButtonState();
}

class _DiscountButtonState extends State<DiscountButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    Future.delayed(Duration(milliseconds: widget.animationDelay), () {
      if (mounted) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fontSize = widget.discount.isSmall ? 11.9 : 13.0;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            onHover: (isHovered) {
              setState(() => _isHovered = isHovered);
            },
            child: Opacity(
              opacity: _isHovered ? 0.8 : 1.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TicketIcon(
                      color: AppColors.brandTeal,
                      size: 29,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.discount.title,
                      style: TextStyle(
                        color: AppColors.brandTeal,
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                        fontFamily: 'NunitoSans',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
