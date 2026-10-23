class Station {
  final String id;
  final String name;
  final String subtitle;
  final bool isActive;
  final bool isEnd;
  final LineOpacity lineOpacity;

  const Station({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.isActive,
    required this.isEnd,
    this.lineOpacity = LineOpacity.full,
  });
}

enum LineOpacity { light, full }

final List<Station> stations = [
  Station(
    id: 'forum-maia',
    name: 'Fórum Maia',
    subtitle: 'Estação Mais Próxima',
    isActive: false,
    isEnd: false,
    lineOpacity: LineOpacity.light,
  ),
  Station(
    id: 'zona-industrial',
    name: 'Zona Industrial',
    subtitle: '3 minutos',
    isActive: true,
    isEnd: false,
    lineOpacity: LineOpacity.full,
  ),
  Station(
    id: 'mandim',
    name: 'Mandim',
    subtitle: '2 minutos',
    isActive: true,
    isEnd: false,
    lineOpacity: LineOpacity.full,
  ),
  Station(
    id: 'castelo-da-maia',
    name: 'Castêlo da Maia',
    subtitle: '3 minutos',
    isActive: true,
    isEnd: false,
    lineOpacity: LineOpacity.full,
  ),
  Station(
    id: 'ismai',
    name: 'ISMAI',
    subtitle: '1 minuto',
    isActive: true,
    isEnd: false,
    lineOpacity: LineOpacity.full,
  ),
];
