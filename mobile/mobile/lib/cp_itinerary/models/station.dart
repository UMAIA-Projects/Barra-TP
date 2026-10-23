enum StationType {
  start,
  stop,
  nearest,
  end,
}

class Station {
  final String name;
  final String? subtitle;
  final StationType type;

  Station({
    required this.name,
    this.subtitle,
    required this.type,
  });
}
