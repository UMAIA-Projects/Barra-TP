import 'package:flutter/foundation.dart';

enum TransportType { bus, train, metro }

enum PriceRange { zero75, range75150, range150225, custom }

enum WalkingTime { min0to15, min15to30, min30to60, custom }

class FilterOptions {
  final Set<TransportType> transportTypes;
  final Set<PriceRange> priceRanges;
  final Set<int> numberOfStops;
  final Set<WalkingTime> walkingTimes;
  final Set<int> maxTransportChanges;

  FilterOptions({
    this.transportTypes = const {},
    this.priceRanges = const {},
    this.numberOfStops = const {},
    this.walkingTimes = const {},
    this.maxTransportChanges = const {},
  });

  FilterOptions copyWith({
    Set<TransportType>? transportTypes,
    Set<PriceRange>? priceRanges,
    Set<int>? numberOfStops,
    Set<WalkingTime>? walkingTimes,
    Set<int>? maxTransportChanges,
  }) {
    return FilterOptions(
      transportTypes: transportTypes ?? this.transportTypes,
      priceRanges: priceRanges ?? this.priceRanges,
      numberOfStops: numberOfStops ?? this.numberOfStops,
      walkingTimes: walkingTimes ?? this.walkingTimes,
      maxTransportChanges: maxTransportChanges ?? this.maxTransportChanges,
    );
  }
}

class PlanningState extends ChangeNotifier {
  String? departureLocation;
  String? destinationLocation;
  DateTime? departureTime;
  DateTime? arrivalTime;
  bool showFilters = false;
  FilterOptions filters = FilterOptions();
  bool isLoading = false;
  String? activeTab = 'planeamento';

  void setDepartureLocation(String location) {
    departureLocation = location;
    notifyListeners();
  }

  void setDestinationLocation(String location) {
    destinationLocation = location;
    notifyListeners();
  }

  void setDepartureTime(DateTime time) {
    departureTime = time;
    notifyListeners();
  }

  void setArrivalTime(DateTime time) {
    arrivalTime = time;
    notifyListeners();
  }

  void toggleFilters() {
    showFilters = !showFilters;
    notifyListeners();
  }

  void updateFilters(FilterOptions newFilters) {
    filters = newFilters;
    notifyListeners();
  }

  void setActiveTab(String tab) {
    activeTab = tab;
    notifyListeners();
  }

  void toggleTransportType(TransportType type) {
    final updated = Set<TransportType>.from(filters.transportTypes);
    if (updated.contains(type)) {
      updated.remove(type);
    } else {
      updated.add(type);
    }
    filters = filters.copyWith(transportTypes: updated);
    notifyListeners();
  }

  void togglePriceRange(PriceRange range) {
    final updated = Set<PriceRange>.from(filters.priceRanges);
    if (updated.contains(range)) {
      updated.remove(range);
    } else {
      updated.add(range);
    }
    filters = filters.copyWith(priceRanges: updated);
    notifyListeners();
  }

  void toggleWalkingTime(WalkingTime time) {
    final updated = Set<WalkingTime>.from(filters.walkingTimes);
    if (updated.contains(time)) {
      updated.remove(time);
    } else {
      updated.add(time);
    }
    filters = filters.copyWith(walkingTimes: updated);
    notifyListeners();
  }

  void search() {
    isLoading = true;
    notifyListeners();
    
    Future.delayed(const Duration(seconds: 2), () {
      isLoading = false;
      notifyListeners();
    });
  }

  void reset() {
    departureLocation = null;
    destinationLocation = null;
    departureTime = null;
    arrivalTime = null;
    filters = FilterOptions();
    isLoading = false;
    notifyListeners();
  }
}
