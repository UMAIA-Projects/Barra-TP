import 'package:flutter/material.dart';

class NavItem {
  final String id;
  final String label;
  final IconData icon;
  final Color backgroundColor;

  NavItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.backgroundColor,
  });
}
