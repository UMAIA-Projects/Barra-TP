class Trip {
  final String departureTime;
  final String departureStation;
  final String arrivalTime;
  final String arrivalStation;
  final String passengers;
  final String date;
  final String price;

  Trip({
    required this.departureTime,
    required this.departureStation,
    required this.arrivalTime,
    required this.arrivalStation,
    required this.passengers,
    required this.date,
    required this.price,
  });
}

class CartData {
  final List<Trip> trips;
  final String additionalFees;
  final String total;

  CartData({
    required this.trips,
    required this.additionalFees,
    required this.total,
  });
}
