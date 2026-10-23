import 'package:flutter/material.dart';

class Trip {
  final String origin;
  final String destination;
  final String startTime;
  final String endTime;
  final List<TripLeg> legs;

  Trip({
    required this.origin,
    required this.destination,
    required this.startTime,
    required this.endTime,
    required this.legs,
  });
}

class TripLeg {
  final String type; // 'walk', 'metro', 'bus'
  final String? icon;
  final String? letter;
  final String? line;
  final Color? color;

  TripLeg({
    required this.type,
    this.icon,
    this.letter,
    this.line,
    this.color,
  });
}
