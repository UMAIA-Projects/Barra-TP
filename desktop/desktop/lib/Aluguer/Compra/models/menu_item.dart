import 'package:flutter/material.dart';

class MenuItem {
  final String name;
  final Widget icon;
  final Color backgroundColor;
  final bool isActive;

  MenuItem({
    required this.name,
    required this.icon,
    required this.backgroundColor,
    this.isActive = false,
  });
}
