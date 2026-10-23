import 'package:flutter/material.dart';
import 'widgets/route_header.dart';
import 'widgets/route_info_bar.dart';
import 'widgets/route_timeline.dart';
import 'widgets/bottom_navigation.dart';
import 'models/station.dart';
import '../common/header_app.dart';
import '../common/navigation_bar.dart';

class ItineraryPage extends StatefulWidget {
  const ItineraryPage({Key? key}) : super(key: key);

  @override
  State<ItineraryPage> createState() => _ItineraryPageState();
}

class _ItineraryPageState extends State<ItineraryPage> {
  String destination = "Lisboa Santa Apolónia";

  final List<Station> stations = [
    Station(name: "Braga", type: StationType.start),
    Station(name: "Nine", type: StationType.stop),
    Station(name: "Famalicão", type: StationType.stop),
    Station(
      name: "Porto - Campanhã",
      subtitle: "Estação Mais Próxima",
      type: StationType.nearest,
    ),
    Station(name: "Vila Nova de Gaia - Devesas", type: StationType.stop),
    Station(name: "Aveiro", type: StationType.stop),
    Station(name: "Coimbra-B", type: StationType.stop),
    Station(name: "Lisboa Oriente", type: StationType.stop),
    Station(name: "Lisboa Santa Apolónia", type: StationType.stop),
    Station(name: "Fim de Viagem", type: StationType.end),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width > 500 
              ? (MediaQuery.of(context).size.width - 500) / 2 
              : 0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 20,
                spreadRadius: 0,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              const HeaderApp(),
              RouteInfoBar(
                destination: destination,
                stationCount: 9,
                onDirectionChange: () {
                  // Handle direction change
                },
              ),
              Expanded(
                child: RouteTimeline(stations: stations),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 2),
    );
  }
}
