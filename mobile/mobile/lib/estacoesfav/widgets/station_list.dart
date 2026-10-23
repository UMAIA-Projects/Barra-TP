import 'package:flutter/material.dart';
import '../models/station_.dart';
import 'station_card.dart';

class StationList extends StatelessWidget {
  const StationList({super.key});

  static const List<Station> stations = [
    Station(
      image: 'https://api.builder.io/api/v1/image/assets/TEMP/721f91f7096ceb525720b93a0fda5aa1a7845fd8?width=246',
      name: 'ISMAI',
      type: 'Estação de Metropolitano',
      rating: '4,2',
      reviewCount: '31',
      transportType: TransportType.metro,
      isFavorite: true,
    ),
    Station(
      image: 'https://api.builder.io/api/v1/image/assets/TEMP/6a74ea9556648b1230066b2bcc3fbc2a597b10b7?width=246',
      name: 'ISMAI (Metro)',
      type: 'Estação de Autocarro',
      rating: '',
      reviewCount: '',
      transportType: TransportType.bus,
      isFavorite: true,
    ),
    Station(
      image: 'https://api.builder.io/api/v1/image/assets/TEMP/62d397125deca807812ca508d763de847cb385f1?width=246',
      name: 'Casa da Música',
      type: 'Estação de Metropolitano',
      rating: '4,4',
      reviewCount: '753',
      transportType: TransportType.metro,
      isFavorite: true,
    ),
    Station(
      image: 'https://api.builder.io/api/v1/image/assets/TEMP/d991972ab1d4c9bcf34d078f39030e1512eefd29?width=246',
      name: 'Fonte do Cuco',
      type: 'Estação de Metropolitano',
      rating: '4,3',
      reviewCount: '33',
      transportType: TransportType.metro,
      isFavorite: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          for (var station in stations)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: StationCard(station: station),
            ),
        ],
      ),
    );
  }
}