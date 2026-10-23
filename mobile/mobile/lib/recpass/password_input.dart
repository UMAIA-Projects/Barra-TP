import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final String placeholder;
  final TextEditingController controller;

  const PasswordInput({
    super.key,
    required this.placeholder,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF475569),
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: TextFormField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          labelText: placeholder,
          labelStyle: const TextStyle(
            fontSize: 18,
            color: Color(0xFF78716C),
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
