class MetroRoute {
  final String line;
  final String name;
  final String time;
  final String detail;

  MetroRoute({
    required this.line,
    required this.name,
    required this.time,
    required this.detail,
  });
}

class MetroStation {
  final String name;
  final String icon;
  final List<MetroRoute> routes;

  MetroStation({
    required this.name,
    required this.icon,
    required this.routes,
  });
}

class BusRoute {
  final String number;
  final String color; // 'cyan' or 'green'
  final String from;
  final String to;

  BusRoute({
    required this.number,
    required this.color,
    required this.from,
    required this.to,
  });
}

class TrainRoute {
  final String code;
  final String color; // 'green' or 'white'
  final String name;
  final bool isOutline;

  TrainRoute({
    required this.code,
    required this.color,
    required this.name,
    this.isOutline = false,
  });
}
