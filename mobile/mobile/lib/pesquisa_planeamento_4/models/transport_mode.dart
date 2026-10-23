import 'package:flutter/material.dart';

enum TransportModeType { car, bus, walk, bike }

class TransportMode {
  final TransportModeType type;
  final String label;
  final String duration;
  final IconData icon;
  final String? assetSvg;

  const TransportMode({
    required this.type,
    required this.label,
    required this.duration,
    required this.icon,
    this.assetSvg,
  });

  static const List<TransportMode> modes = [
    TransportMode(
      type: TransportModeType.car,
      label: 'Carro',
      duration: '6 min',
      icon: Icons.directions_car,
      assetSvg: 'assets/icons/car.svg',
    ),
    TransportMode(
      type: TransportModeType.bus,
      label: 'Autocarro',
      duration: '7 min',
      icon: Icons.directions_bus,
      assetSvg: 'assets/icons/bus.svg',
    ),
    TransportMode(
      type: TransportModeType.walk,
      label: 'A Pé',
      duration: '31 min',
      icon: Icons.directions_walk,
      assetSvg: 'assets/icons/walk.svg',
    ),
    TransportMode(
      type: TransportModeType.bike,
      label: 'Bicicleta',
      duration: '9 min',
      icon: Icons.pedal_bike,
      assetSvg: 'assets/icons/bike.svg',
    ),
  ];

  factory TransportMode.fromType(TransportModeType type) {
    return modes.firstWhere((mode) => mode.type == type);
  }
}
