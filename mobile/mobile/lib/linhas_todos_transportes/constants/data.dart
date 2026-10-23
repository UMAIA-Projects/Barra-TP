import 'package:flutter/material.dart';
import '../models/metro_line.dart';
import 'colors.dart';

final List<MetroLine> metroLines = [
  MetroLine(
    id: 'A',
    name: 'Linha Azul',
    color: BarraTPColors.lineA.toString(),
    textColor: Colors.white.toString(),
  ),
  MetroLine(
    id: 'B',
    name: 'Linha Vermelha',
    color: BarraTPColors.lineB.toString(),
    textColor: Colors.white.toString(),
  ),
  MetroLine(
    id: 'Bx',
    name: 'Linha Vermelha (Expresso)',
    color: BarraTPColors.lineB.toString(),
    textColor: Colors.white.toString(),
  ),
  MetroLine(
    id: 'C',
    name: 'Linha Verde',
    color: BarraTPColors.lineC.toString(),
    textColor: Colors.white.toString(),
  ),
  MetroLine(
    id: 'D',
    name: 'Linha Amarela',
    color: BarraTPColors.lineD.toString(),
    textColor: Colors.white.toString(),
  ),
  MetroLine(
    id: 'E',
    name: 'Linha Violeta',
    color: BarraTPColors.lineE.toString(),
    textColor: Colors.white.toString(),
  ),
  MetroLine(
    id: 'F',
    name: 'Linha Laranja',
    color: BarraTPColors.lineF.toString(),
    textColor: Colors.white.toString(),
  ),
];

final List<BusRoute> busRoutes = [
  BusRoute(id: '1M', destination: 'Matosinhos (Praia)'),
  BusRoute(id: '2M', destination: 'Hospital São João'),
  BusRoute(id: '3M', destination: 'Aeroporto'),
  BusRoute(id: '4M', destination: 'Maia (Camâra)'),
  BusRoute(id: '5M', destination: 'Ermesinde (Estação)'),
  BusRoute(id: '7M', destination: 'Valongo (Centro)'),
  BusRoute(id: '8M', destination: 'S. Pedro da Cova (Passal)'),
  BusRoute(id: '9M', destination: 'Gondomar (Souto)'),
  BusRoute(id: '10M', destination: 'Vila D\'Este'),
];
