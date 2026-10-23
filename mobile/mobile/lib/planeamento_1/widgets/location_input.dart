import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LocationInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback? onTap;

  const LocationInput({
    Key? key,
    required this.label,
    required this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.borderColor,
            width: 1.4,
          ),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 2.76,
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          readOnly: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: AppTheme.textStyle(
              color: AppTheme.textColor,
              fontSize: 10.5,
              fontWeight: FontWeight.w800,
              fontFamily: 'NunitoSans',
            ),
            border: InputBorder.none,
            filled: true,
            fillColor: AppTheme.lightGrey,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
          ),
          style: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 10.5,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
        ),
      ),
    );
  }
}

class TimeInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Future<TimeOfDay?> Function(BuildContext) onShowTime;

  const TimeInput({
    Key? key,
    required this.label,
    required this.controller,
    required this.onShowTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final time = await onShowTime(context);
        if (time != null) {
          controller.text = '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.borderColor,
            width: 1.4,
          ),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 2.76,
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          readOnly: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: label,
            hintStyle: AppTheme.textStyle(
              color: AppTheme.textColor,
              fontSize: 10.5,
              fontWeight: FontWeight.w800,
              fontFamily: 'NunitoSans',
            ),
            border: InputBorder.none,
            filled: true,
            fillColor: AppTheme.lightGrey,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
          ),
          style: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 10.5,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
        ),
      ),
    );
  }
}

class SimpleInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;

  const SimpleInputField({
    Key? key,
    required this.label,
    required this.controller,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.borderColor,
          width: 1.4,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 2.76,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: label,
          hintStyle: AppTheme.textStyle(
            color: AppTheme.textColor,
            fontSize: 10.5,
            fontWeight: FontWeight.w800,
            fontFamily: 'NunitoSans',
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: AppTheme.lightGrey,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 12,
          ),
        ),
        style: AppTheme.textStyle(
          color: AppTheme.textColor,
          fontSize: 10.5,
          fontWeight: FontWeight.w800,
          fontFamily: 'NunitoSans',
        ),
      ),
    );
  }
}
