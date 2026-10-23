class Trip {
  final String id;
  final String company;
  final String departureTime;
  final String departureLocation;
  final String arrivalTime;
  final String arrivalLocation;
  final String date;
  final String seats;
  final String type;
  final String duration;
  final String distance;
  final String price;

  Trip({
    required this.id,
    required this.company,
    required this.departureTime,
    required this.departureLocation,
    required this.arrivalTime,
    required this.arrivalLocation,
    required this.date,
    required this.seats,
    required this.type,
    required this.duration,
    required this.distance,
    required this.price,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'] ?? '',
      company: json['company'] ?? '',
      departureTime: json['departureTime'] ?? '',
      departureLocation: json['departureLocation'] ?? '',
      arrivalTime: json['arrivalTime'] ?? '',
      arrivalLocation: json['arrivalLocation'] ?? '',
      date: json['date'] ?? '',
      seats: json['seats'] ?? '',
      type: json['type'] ?? '',
      duration: json['duration'] ?? '',
      distance: json['distance'] ?? '',
      price: json['price'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'company': company,
      'departureTime': departureTime,
      'departureLocation': departureLocation,
      'arrivalTime': arrivalTime,
      'arrivalLocation': arrivalLocation,
      'date': date,
      'seats': seats,
      'type': type,
      'duration': duration,
      'distance': distance,
      'price': price,
    };
  }
}
