class BusStop {
  final String name;
  final String? description;
  final String? duration;
  final bool isCurrent;
  final bool isFinal;
  final String? nextTime;

  BusStop({
    required this.name,
    this.description,
    this.duration,
    this.isCurrent = false,
    this.isFinal = false,
    this.nextTime,
  });
}

class BusRoute {
  final String routeNumber;
  final String company;
  final String origin;
  final String destination;
  final int totalStops;
  final List<BusStop> stops;

  BusRoute({
    required this.routeNumber,
    required this.company,
    required this.origin,
    required this.destination,
    required this.totalStops,
    required this.stops,
  });

  static BusRoute getDefaultRoute() {
    return BusRoute(
      routeNumber: '604',
      company: 'STCP - Sociedade Transportes Coletivos do Porto',
      origin: 'Aliados',
      destination: 'Maia (Câmara)',
      totalStops: 3,
      stops: [
        BusStop(
          name: 'Rotunda do Lavrador',
        ),
        BusStop(
          name: 'Santos Leite',
          description: 'Estação Mais Próxima',
          isCurrent: true,
          duration: '2 minutos',
          nextTime: '06:48, 07:09',
        ),
        BusStop(
          name: 'Igreja da Maia',
          duration: '2 minutos',
        ),
        BusStop(
          name: 'Maia (Câmara)',
          duration: '1 minutos',
        ),
        BusStop(
          name: 'Fim de Viagem - 3 minutos',
          isFinal: true,
        ),
      ],
    );
  }
}
