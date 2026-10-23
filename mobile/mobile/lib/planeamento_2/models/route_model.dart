class RouteModel {
  final int id;
  final String departure;
  final String arrival;
  final List<String> segments; // ['walk', 'bus_604', 'metro_c', etc]
  final List<String> busNumbers;
  final List<String> metroLines;
  final int duration; // in minutes

  RouteModel({
    required this.id,
    required this.departure,
    required this.arrival,
    required this.segments,
    required this.busNumbers,
    required this.metroLines,
    required this.duration,
  });

  bool get hasWalking => segments.contains('walk');
  
  String get displayTime => '$departure - $arrival';
}
