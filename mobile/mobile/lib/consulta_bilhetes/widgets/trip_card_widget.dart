import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/trip_model.dart';
import '../theme/app_theme.dart';

class TripCardWidget extends StatelessWidget {
  final Trip trip;
  final VoidCallback? onAddSeat;

  const TripCardWidget({
    Key? key,
    required this.trip,
    this.onAddSeat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.barrateal, width: 0.88),
        borderRadius: BorderRadius.circular(3.5),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(32, 0, 0, 0),
            blurRadius: 2.87,
            offset: Offset(0, 2.87),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 8),
          _buildRouteInfo(),
          const SizedBox(height: 4),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trip.company,
                style: GoogleFonts.nunitoSans(
                  color: AppColors.barrateal,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
              // Horário de partida REMOVIDO daqui (foi movido para _buildRouteInfo)
            ],
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (trip.transportType == TransportType.plane)
                  const Icon(Icons.airplanemode_active,
                      color: AppColors.barrateal, size: 16),
                const SizedBox(width: 3),
                const Icon(Icons.card_travel,
                    color: AppColors.barrateal, size: 16),
                const SizedBox(width: 3),
                const Icon(Icons.directions_bus,
                    color: AppColors.barrateal, size: 16),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              trip.price,
              style: GoogleFonts.nunitoSans(
                color: AppColors.barraGray,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              trip.availability,
              style: GoogleFonts.nunitoSans(
                color: AppColors.barraRed,
                fontSize: 8,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRouteInfo() {
    return Row(
      children: [
        // Coluna da ESQUERDA com horário e local de partida
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HORÁRIO DE PARTIDA (acima do local)
              Text(
                trip.departureTime,
                style: GoogleFonts.nunitoSans(
                  color: AppColors.barraGray,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // LOCAL DE PARTIDA (abaixo do horário)
              Text(
                trip.departureLocation,
                style: GoogleFonts.nunitoSans(
                  color: AppColors.barraGray,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // Seta no centro
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: const Icon(Icons.arrow_forward,
              color: AppColors.barrateal, size: 20),
        ),
        // Coluna da DIREITA com horário e local de destino
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // HORÁRIO DE CHEGADA (acima do destino)
              Text(
                trip.arrivalTime,
                style: GoogleFonts.nunitoSans(
                  color: AppColors.barraGray,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // LOCAL DE DESTINO (abaixo do horário)
              Text(
                trip.arrivalLocation,
                style: GoogleFonts.nunitoSans(
                  color: AppColors.barraGray,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Coluna da esquerda com ITINERÁRIO e informações
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ITINERÁRIO movido para ficar acima de "direto..."
              Text(
                'ITINERÁRIO',
                style: GoogleFonts.nunitoSans(
                  color: AppColors.barrateal,
                  fontSize: 9,
                  fontWeight: FontWeight.w900,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: trip.isDirect ? 'direto' : '',
                      style: GoogleFonts.nunitoSans(
                        color: AppColors.barraRed,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    if (trip.isDirect && trip.hasStops)
                      TextSpan(
                        text: ' > sem paragens',
                        style: GoogleFonts.nunitoSans(
                          color: AppColors.barraRed,
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    TextSpan(
                      text: trip.isDirect && trip.hasStops
                          ? ' ${trip.duration}, ${trip.distance}'
                          : trip.isDirect
                              ? ' ${trip.duration}, ${trip.distance}'
                              : '${trip.duration}, ${trip.distance}',
                      style: GoogleFonts.nunitoSans(
                        color: AppColors.barraGrayDark,
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Botão à direita
        ElevatedButton(
          onPressed: onAddSeat,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(const Color(0xFF475569)),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
                horizontal: 17, vertical: 10)),
            elevation: WidgetStateProperty.all(0),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            minimumSize: WidgetStateProperty.all(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'Comprar Bilhete',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunitoSans(
              fontSize: 9,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.1,
            ),
          ),
        ),
      ],
    );
  }
}