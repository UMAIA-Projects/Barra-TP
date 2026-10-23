enum RouteType { metro, bus }

class TransportRoute {
  final String number;
  final String from;
  final String to;
  final RouteType type;

  TransportRoute({
    required this.number,
    required this.from,
    required this.to,
    required this.type,
  });
}

class RouteData {
  static final List<TransportRoute> allRoutes = [
    TransportRoute(number: '1M', from: 'Aliados', to: 'Matosinhos (Praia)', type: RouteType.metro),
    TransportRoute(number: '2M', from: 'Aliados', to: 'Hospital São João', type: RouteType.metro),
    TransportRoute(number: '3M', from: 'Aliados', to: 'Aeroporto', type: RouteType.metro),
    TransportRoute(number: '4M', from: 'Aliados', to: 'Maia (Camâra)', type: RouteType.metro),
    TransportRoute(number: '5M', from: 'Aliados', to: 'Ermesinde (Estação)', type: RouteType.metro),
    TransportRoute(number: '7M', from: 'Aliados', to: 'Valongo (Centro)', type: RouteType.metro),
    TransportRoute(number: '8M', from: 'Aliados', to: 'S. Pedro da Cova (Passal)', type: RouteType.metro),
    TransportRoute(number: '9M', from: 'Aliados', to: 'Gondomar (Souto)', type: RouteType.metro),
    TransportRoute(number: '10M', from: 'Aliados', to: 'Vila D\'Este', type: RouteType.metro),
    TransportRoute(number: '11M', from: 'Hospital São João', to: 'Coimbrões (Quinta da Bela)', type: RouteType.metro),
    TransportRoute(number: '12M', from: 'Aliados', to: 'Santo Ovídio', type: RouteType.metro),
    TransportRoute(number: '13M', from: 'Aliados', to: 'Matosinhos (Mercado)', type: RouteType.metro),
    TransportRoute(number: '200', from: 'Bolhão', to: 'Castelo do Queijo', type: RouteType.bus),
    TransportRoute(number: '201', from: 'Aliados', to: 'Viso', type: RouteType.bus),
    TransportRoute(number: '202', from: 'Aliados', to: 'Passeio Alegre', type: RouteType.bus),
    TransportRoute(number: '203', from: 'Marquês', to: 'Castelo do Queijo', type: RouteType.bus),
    TransportRoute(number: '204', from: 'Hospital São João', to: 'Foz', type: RouteType.bus),
    TransportRoute(number: '205', from: 'Campanhã', to: 'Castelo do Queijo', type: RouteType.bus),
    TransportRoute(number: '206', from: 'Campanhã', to: 'Viso / Santo Eugénio', type: RouteType.bus),
    TransportRoute(number: '207', from: 'Campanhã', to: 'Foz (Mercado)', type: RouteType.bus),
    TransportRoute(number: '208', from: 'Trindade', to: 'Aldoar (J. Freg.)', type: RouteType.bus),
    TransportRoute(number: '209', from: 'Pasteleira', to: 'Prelada', type: RouteType.bus),
    TransportRoute(number: '300', from: 'Circular | Aliados', to: 'Hospital São João', type: RouteType.bus),
    TransportRoute(number: '301', from: 'Circular | Praça Liberdade', to: 'Hospital São João', type: RouteType.bus),
    TransportRoute(number: '302', from: 'Circular | Aliados', to: 'Damião de Góis', type: RouteType.bus),
  ];
}
