class FilterModel {
  final Map<String, bool> transportTypes;
  final Map<String, bool> priceRanges;

  FilterModel({
    required this.transportTypes,
    required this.priceRanges,
  });

  bool get hasActiveFilters {
    return transportTypes.values.any((v) => v) || 
           priceRanges.values.any((v) => v);
  }
}
