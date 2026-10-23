class RouteModel {
  final String id;
  final String origin;
  final String destination;
  final int duration; // in minutes
  final double distance; // in km
  final String transportMode;
  final String departureTime;
  final bool avoidTolls;
  final bool avoidHighways;
  final String mapImageUrl;
  final List<RouteStep> steps;

  RouteModel({
    required this.id,
    required this.origin,
    required this.destination,
    required this.duration,
    required this.distance,
    required this.transportMode,
    required this.departureTime,
    required this.avoidTolls,
    required this.avoidHighways,
    required this.mapImageUrl,
    required this.steps,
  });

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      id: json['id'] ?? '',
      origin: json['origin'] ?? '',
      destination: json['destination'] ?? '',
      duration: json['duration'] ?? 0,
      distance: (json['distance'] ?? 0).toDouble(),
      transportMode: json['transportMode'] ?? 'car',
      departureTime: json['departureTime'] ?? '',
      avoidTolls: json['avoidTolls'] ?? false,
      avoidHighways: json['avoidHighways'] ?? false,
      mapImageUrl: json['mapImageUrl'] ?? '',
      steps: (json['steps'] as List<dynamic>?)
              ?.map((step) => RouteStep.fromJson(step as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'origin': origin,
      'destination': destination,
      'duration': duration,
      'distance': distance,
      'transportMode': transportMode,
      'departureTime': departureTime,
      'avoidTolls': avoidTolls,
      'avoidHighways': avoidHighways,
      'mapImageUrl': mapImageUrl,
      'steps': steps.map((step) => step.toJson()).toList(),
    };
  }
}

class RouteStep {
  final String instruction;
  final double distance; // in meters
  final String icon;

  RouteStep({
    required this.instruction,
    required this.distance,
    required this.icon,
  });

  factory RouteStep.fromJson(Map<String, dynamic> json) {
    return RouteStep(
      instruction: json['instruction'] ?? '',
      distance: (json['distance'] ?? 0).toDouble(),
      icon: json['icon'] ?? 'default',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'instruction': instruction,
      'distance': distance,
      'icon': icon,
    };
  }
}

class TransportMode {
  final String id;
  final String label;
  final String icon;
  final int estimatedTime; // in minutes

  TransportMode({
    required this.id,
    required this.label,
    required this.icon,
    required this.estimatedTime,
  });
}
