class Station {
  final String image;
  final String name;
  final String type;
  final String rating;
  final String reviewCount;
  final bool isFavorite;
  final TransportType transportType;

  const Station({
    required this.image,
    required this.name,
    required this.type,
    required this.rating,
    required this.reviewCount,
    this.isFavorite = false,
    required this.transportType,
  });
}

enum TransportType { metro, bus }
