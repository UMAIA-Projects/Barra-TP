import 'package:flutter/material.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';
import '../theme/colors.dart';
import '../widgets/ticket_card.dart';
import '../widgets/trip_card.dart';
import '../models/ticket.dart';
import '../models/trip.dart';
import '../../consulta/screens/consulta.dart' as Consulta;
import '../../ver_todos_daConsulta/screens/ver_todos_da_consulta.dart' as VerTodos;
import '../../planeamento_1/screens/home_screen.dart' as Planeamento1;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Ticket> purchasedTickets = [
    Ticket(
      company: 'Barra TP',
      departureTime: '15:30',
      departureLocation: 'Lisboa (Oriente)',
      arrivalTime: '18:50',
      arrivalLocation: 'Porto (Campanhã)',
      date: '24/01/2024',
      status: 'Bilhete utilizado',
    ),
    Ticket(
      company: 'Barra TP',
      departureTime: '09:00',
      departureLocation: 'Braga',
      arrivalTime: '14:20',
      arrivalLocation: 'Braga (Oriente)',
      date: '14/08/2023',
      status: 'Bilhete utilizado',
    ),
  ];

  final List<Trip> plannedTrips = [
    Trip(
      origin: 'Aeroporto',
      destination: 'S. Tomé',
      startTime: '21:09',
      endTime: '21:56',
      legs: [
        TripLeg(type: 'walk', icon: 'walk'),
        TripLeg(type: 'metro', letter: 'E', color: AppColors.busPurple),
        TripLeg(type: 'metro', icon: 'metro'),
        TripLeg(type: 'walk', icon: 'walk'),
        TripLeg(type: 'bus', line: '505', color: AppColors.busYellow),
      ],
    ),
    Trip(
      origin: 'Guardeiras',
      destination: 'Hospital São João',
      startTime: '20:57',
      endTime: '21:17',
      legs: [
        TripLeg(type: 'walk', icon: 'walk'),
        TripLeg(type: 'bus', line: '602', color: AppColors.busGreen),
        TripLeg(type: 'bus', line: '505', color: AppColors.busYellow),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.background,
        child: Column(
          children: [
            // Header
            const HeaderApp(),
            // Private Area
            _buildPrivateAreaBar(),
            // Tab Bar
            _buildTabBar(),
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildPurchasedTicketsSection(),
                    _buildPlannedTripsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 3),
    );
  }

  Widget _buildPrivateAreaBar() {
    return Container(
      color: Color(0xFF407079),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(
              Icons.person,
              color: AppColors.primary,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Área Privada',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Color(0xFF407079),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: const Text(
              'Bilhetes e Planeamentos',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const VerTodos.VerTodosDaConsulta(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: const Text(
                'Descontos',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPurchasedTicketsSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bilhetes Comprados',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: 'DaysOne',
                      fontSize: 13,
                      color: AppColors.primary,
                    ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Consulta.Consulta(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  backgroundColor: AppColors.primary,
                  elevation: 4,
                ),
                child: const Text(
                  'Comprar Novo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: AppColors.primary, thickness: 1),
          const SizedBox(height: 16),
          // Tickets
          ...purchasedTickets
              .map((ticket) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TicketCard(ticket: ticket),
                  ))
              .toList(),
          Text(
            'sem mais bilhetes comprados',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.primary,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w200,
                  fontSize: 11,
                ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

  Widget _buildPlannedTripsSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Planeamentos Feitos',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontFamily: 'DaysOne',
                      fontSize: 13,
                      color: AppColors.primary,
                    ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Planeamento1.HomeScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  backgroundColor: AppColors.primary,
                  elevation: 4,
                ),
                child: const Text(
                  'Fazer Novo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(color: AppColors.primary, thickness: 1),
          const SizedBox(height: 16),
          // Trip Cards
          ...plannedTrips
              .map((trip) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: TripCard(trip: trip),
                  ))
              .toList(),
          Text(
            'sem mais planeamentos',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.primary,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w200,
                  fontSize: 11,
                ),
            textAlign: TextAlign.right,
          ),
        ],
      ),
    );
  }

}
