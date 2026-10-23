import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/station_model.dart';

class ApiService {
  // Replace with your actual API base URL
  static const String baseUrl = 'https://api.example.com';

  // Fetch all stations
  static Future<List<Station>> fetchStations() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/stations'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => _parseStation(json)).toList();
      } else {
        throw Exception('Failed to load stations');
      }
    } catch (e) {
      print('Error fetching stations: $e');
      // Return mock data on error for development
      return getMockStations();
    }
  }

  // Fetch stations near a location
  static Future<List<Station>> fetchNearbyStations(
    double latitude,
    double longitude, {
    double radiusInKm = 5,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/stations/nearby?lat=$latitude&lng=$longitude&radius=$radiusInKm',
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => _parseStation(json)).toList();
      } else {
        throw Exception('Failed to load nearby stations');
      }
    } catch (e) {
      print('Error fetching nearby stations: $e');
      return getMockStations();
    }
  }

  // Fetch schedules for a specific station
  static Future<List<Schedule>> fetchSchedules(String stationId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/stations/$stationId/schedules'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data
            .map((json) => Schedule(
                  direction: json['direction'],
                  time: json['time'],
                  duration: json['duration'],
                  lineCode: json['lineCode'],
                ))
            .toList();
      } else {
        throw Exception('Failed to load schedules');
      }
    } catch (e) {
      print('Error fetching schedules: $e');
      return [];
    }
  }

  // Fetch bus routes for a station
  static Future<List<BusRoute>> fetchBusRoutes(String stationId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/stations/$stationId/routes'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data
            .map((json) => BusRoute(
                  number: json['number'],
                  destination: json['destination'],
                  badgeColor: json['badgeColor'],
                ))
            .toList();
      } else {
        throw Exception('Failed to load bus routes');
      }
    } catch (e) {
      print('Error fetching bus routes: $e');
      return [];
    }
  }

  // Parse station from JSON
  static Station _parseStation(Map<String, dynamic> json) {
    return Station(
      id: json['id'],
      name: json['name'],
      type: json['type'] ?? 'metro',
      walkTime: json['walkTime'] ?? '',
      metro: json['metro'],
      busRoutes: (json['busRoutes'] as List<dynamic>?)
              ?.map((route) => BusRoute(
                    number: route['number'],
                    destination: route['destination'],
                    badgeColor: route['badgeColor'] ?? 'blue',
                  ))
              .toList() ??
          [],
      schedules: (json['schedules'] as List<dynamic>?)
              ?.map((schedule) => Schedule(
                    direction: schedule['direction'],
                    time: schedule['time'],
                    duration: schedule['duration'],
                    lineCode: schedule['lineCode'],
                  ))
              .toList() ??
          [],
      logoUrl: json['logoUrl'],
    );
  }

  // Example POST request for adding a favorite
  static Future<bool> addFavorite(String stationId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/favorites'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'stationId': stationId}),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print('Error adding favorite: $e');
      return false;
    }
  }

  // Remove favorite
  static Future<bool> removeFavorite(String stationId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/favorites/$stationId'),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error removing favorite: $e');
      return false;
    }
  }

  // Get user's favorite stations
  static Future<List<Station>> fetchFavorites() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/favorites'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => _parseStation(json)).toList();
      } else {
        throw Exception('Failed to load favorites');
      }
    } catch (e) {
      print('Error fetching favorites: $e');
      return [];
    }
  }

  // Search stations by name
  static Future<List<Station>> searchStations(String query) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/stations/search?q=$query'),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => _parseStation(json)).toList();
      } else {
        throw Exception('Failed to search stations');
      }
    } catch (e) {
      print('Error searching stations: $e');
      return [];
    }
  }
}
