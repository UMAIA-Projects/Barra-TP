enum TransportType { bus, plane }

class Trip {
  final String company;
  final String departureTime;
  final String departureLocation;
  final String arrivalTime;
  final String arrivalLocation;
  final String price;
  final String availability;
  final String duration;
  final String distance;
  final bool isDirect;
  final bool hasStops;
  final TransportType transportType;

  Trip({
    required this.company,
    required this.departureTime,
    required this.departureLocation,
    required this.arrivalTime,
    required this.arrivalLocation,
    required this.price,
    required this.availability,
    required this.duration,
    required this.distance,
    required this.isDirect,
    this.hasStops = false,
    this.transportType = TransportType.bus,
  });
}

class SearchCriteria {
  final String origin;
  final String destination;
  final DateTime departureDate;
  final DateTime? returnDate;
  final int adults;
  final int children;
  final int seniors;
  final bool isNational;

  SearchCriteria({
    required this.origin,
    required this.destination,
    required this.departureDate,
    this.returnDate,
    this.adults = 1,
    this.children = 0,
    this.seniors = 0,
    this.isNational = true,
  });
}
