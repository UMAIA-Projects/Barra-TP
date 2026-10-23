import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/app_constants.dart';
import '../models/trip_model.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  ApiService._internal();

  // Fetch trips based on search criteria
  Future<List<Trip>> searchTrips(SearchCriteria criteria) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${AppConstants.baseUrl}${AppConstants.searchEndpoint}'
          '?origin=${criteria.origin}'
          '&destination=${criteria.destination}'
          '&date=${criteria.departureDate.toIso8601String()}'
          '&isNational=${criteria.isNational}',
        ),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((trip) => _parseTrip(trip)).toList();
      } else {
        throw Exception('Failed to load trips: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching trips: $e');
    }
  }

  // Book a trip
  Future<Map<String, dynamic>> bookTrip({
    required String tripId,
    required String passengerId,
    required int numberOfSeats,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.bookingEndpoint}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'tripId': tripId,
          'passengerId': passengerId,
          'numberOfSeats': numberOfSeats,
        }),
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to book trip: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error booking trip: $e');
    }
  }

  // Parse trip from JSON
  Trip _parseTrip(dynamic json) {
    return Trip(
      company: json['company'] ?? 'Barra TP',
      departureTime: json['departureTime'] ?? '',
      departureLocation: json['departureLocation'] ?? '',
      arrivalTime: json['arrivalTime'] ?? '',
      arrivalLocation: json['arrivalLocation'] ?? '',
      price: json['price'] ?? '0€',
      availability: json['availability'] ?? '',
      duration: json['duration'] ?? '',
      distance: json['distance'] ?? '',
      isDirect: json['isDirect'] ?? true,
      hasStops: json['hasStops'] ?? false,
      transportType: json['transportType'] == 'plane'
          ? TransportType.plane
          : TransportType.bus,
    );
  }
}
