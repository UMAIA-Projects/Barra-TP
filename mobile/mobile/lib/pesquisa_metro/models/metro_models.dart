class MetroLine {
  final String id;
  final String name;
  final String lineCode;
  final int arrivalMinutes;
  final String arrivalTime;

  MetroLine({
    required this.id,
    required this.name,
    required this.lineCode,
    required this.arrivalMinutes,
    required this.arrivalTime,
  });
}

class MetroStation {
  final String id;
  final String name;
  final String lineCode;
  final String currentLocation;
  final List<MetroLine> nextArrivals;

  MetroStation({
    required this.id,
    required this.name,
    required this.lineCode,
    required this.currentLocation,
    required this.nextArrivals,
  });
}
