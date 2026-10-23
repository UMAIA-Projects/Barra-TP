import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class BarraTPHeader extends StatelessWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onLocationTap;

  const BarraTPHeader({
    Key? key,
    required this.onMenuTap,
    required this.onLocationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.tealDark,
      child: Column(
        children: [
          Container(
            height: 58,
            color: AppColors.tealDark,
          ),
          Container(
            height: 53,
            color: AppColors.tealDark,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: onMenuTap,
                    child: const Icon(
                      Icons.menu,
                      color: Color(0xFFE3E3E3),
                      size: 28,
                    ),
                  ),
                ),
                Text(
                  'BARRA TP',
                  style: GoogleFonts.daysOne(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    height: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: onLocationTap,
                    child: const Icon(
                      Icons.location_on,
                      color: AppColors.white,
                      size: 32,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Pesquisar...',
          filled: true,
          fillColor: AppColors.lightGray,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.tealDark),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.tealDark),
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(
              Icons.search,
              color: AppColors.black,
              size: 24,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isSecondary;

  const ActionButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isSecondary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.tealLight,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: const BorderSide(color: AppColors.tealDark),
          ),
          elevation: 4,
        ),
        child: Text(
          label,
          style: GoogleFonts.nunitoSans(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

class LocationInputField extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final Color dotColor;
  final IconData? leadingIcon;

  const LocationInputField({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.dotColor,
    this.leadingIcon,
  }) : super(key: key);

  @override
  State<LocationInputField> createState() => _LocationInputFieldState();
}

class _LocationInputFieldState extends State<LocationInputField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(LocationInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12, top: 5),
          child: SizedBox(
            width: 20,
            height: 20,
            child: widget.leadingIcon != null
                ? Icon(widget.leadingIcon, color: widget.dotColor, size: 20)
                : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: widget.dotColor, width: 2),
                      color: AppColors.white,
                    ),
                    child: Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.dotColor,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        Expanded(
          child: TextField(
            controller: _controller,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              hintText: widget.leadingIcon != null ? 'Destination' : 'Origin',
              filled: true,
              fillColor: AppColors.grayMedium,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: AppColors.tealDark),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
            style: GoogleFonts.nunitoSans(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: AppColors.tealDark,
            ),
          ),
        ),
      ],
    );
  }
}

class TransportModeButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const TransportModeButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black54),
              color: isSelected ? AppColors.grayMedium : AppColors.grayDark,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: isSelected ? AppColors.tealDark : Colors.white,
              size: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.nunitoSans(
              fontSize: 9,
              fontWeight: FontWeight.w200,
              color: AppColors.tealDark,
            ),
          ),
        ],
      ),
    );
  }
}

class OptionChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;
  final IconData? icon;

  const OptionChip({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.grayDark : AppColors.grayMedium,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.black54),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && isSelected) ...[
              Icon(
                icon,
                color: AppColors.tealDark,
                size: 10,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: GoogleFonts.nunitoSans(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: AppColors.tealDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoutePrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const RoutePrimaryButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.tealLight,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: AppColors.tealDark),
        ),
        elevation: 4,
      ),
      child: Text(
        label,
        style: GoogleFonts.nunitoSans(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: AppColors.white,
        ),
      ),
    );
  }
}