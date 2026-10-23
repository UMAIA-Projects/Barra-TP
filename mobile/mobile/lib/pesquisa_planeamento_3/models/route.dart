class RouteStop {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final String type; // 'origin' or 'destination'

  const RouteStop({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.type,
  });
}

class RouteStep {
  final String instruction;
  final String? distance;
  final String direction;
  final int? duration;

  const RouteStep({
    required this.instruction,
    this.distance,
    required this.direction,
    this.duration,
  });
}

class TransitRoute {
  final String id;
  final RouteStop origin;
  final RouteStop destination;
  final List<RouteStep> steps;
  final int estimatedDuration; // in minutes
  final double distance; // in km
  final DateTime departureTime;
  final bool avoidTolls;
  final bool avoidHighways;

  const TransitRoute({
    required this.id,
    required this.origin,
    required this.destination,
    required this.steps,
    required this.estimatedDuration,
    required this.distance,
    required this.departureTime,
    this.avoidTolls = true,
    this.avoidHighways = false,
  });
}
