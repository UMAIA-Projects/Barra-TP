class MetroLine {
  final String id;
  final String name;
  final String color;
  final String textColor;

  MetroLine({
    required this.id,
    required this.name,
    required this.color,
    required this.textColor,
  });
}

class BusRoute {
  final String id;
  final String destination;

  BusRoute({
    required this.id,
    required this.destination,
  });
}

class TransportSection {
  final String title;
  final String type; // 'metro', 'bus', 'other'
  final List<dynamic> items; // Can be MetroLine or BusRoute

  TransportSection({
    required this.title,
    required this.type,
    required this.items,
  });
}
