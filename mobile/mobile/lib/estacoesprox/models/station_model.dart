class Station {
  final String id;
  final String name;
  final String type; // 'metro' or 'bus'
  final String walkTime;
  final String? metro;
  final String? metroIcon;
  final String? busIcon;
  final List<BusRoute> busRoutes;
  final List<Schedule>? schedules;
  final String? logoUrl;

  Station({
    required this.id,
    required this.name,
    required this.type,
    required this.walkTime,
    this.metro,
    this.metroIcon,
    this.busIcon,
    required this.busRoutes,
    this.schedules,
    this.logoUrl,
  });
}

class BusRoute {
  final String number;
  final String destination;
  final String badgeColor; // 'blue' or 'mint'
  final bool isExpanded;

  BusRoute({
    required this.number,
    required this.destination,
    required this.badgeColor,
    this.isExpanded = false,
  });

  BusRoute copyWith({
    String? number,
    String? destination,
    String? badgeColor,
    bool? isExpanded,
  }) {
    return BusRoute(
      number: number ?? this.number,
      destination: destination ?? this.destination,
      badgeColor: badgeColor ?? this.badgeColor,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }
}

class Schedule {
  final String direction;
  final String time;
  final String duration;
  final String lineCode; // e.g., 'C'

  Schedule({
    required this.direction,
    required this.time,
    required this.duration,
    required this.lineCode,
  });
}

// Mock data for demonstration
List<Station> getMockStations() {
  return [
    Station(
      id: 'ismai-1',
      name: 'ISMAI',
      type: 'metro',
      walkTime: 'Caminhe 5 minutos',
      metro: 'ISMAI',
      schedules: [
        Schedule(
          direction: 'Sentido Campanhã',
          time: '17:30',
          duration: '30min',
          lineCode: 'C',
        ),
        Schedule(
          direction: 'Sentido Campanhã',
          time: '17:50',
          duration: '50min',
          lineCode: 'C',
        ),
      ],
      busRoutes: [],
    ),
    Station(
      id: 'ismai-metro-1',
      name: 'ISMAI (Metro)',
      type: 'metro',
      walkTime: 'Caminhe 2 minutos | 3506 |',
      metro: 'ISMAI (Metro)',
      logoUrl:
          'https://api.builder.io/api/v1/image/assets/TEMP/27141351828b710e82ba6ae674a331199fb0e01a?width=98',
      busRoutes: [
        BusRoute(
          number: '3506',
          destination: 'Maia (Centro)',
          badgeColor: 'blue',
        ),
        BusRoute(
          number: '6306',
          destination: 'Santo Tirso (Estação)',
          badgeColor: 'mint',
        ),
      ],
    ),
    Station(
      id: 'ismai-metro-2',
      name: 'ISMAI (Metro)',
      type: 'metro',
      walkTime: 'Caminhe 3 minutos | 3506, 6306 |',
      metro: 'ISMAI (Metro)',
      logoUrl:
          'https://api.builder.io/api/v1/image/assets/TEMP/27141351828b710e82ba6ae674a331199fb0e01a?width=98',
      busRoutes: [
        BusRoute(
          number: '3506',
          destination: 'Vila do Conde (Centro)',
          badgeColor: 'blue',
        ),
      ],
    ),
  ];
}
