import 'package:flutter/material.dart'; 
import 'package:google_fonts/google_fonts.dart'; 
import 'package:desktop/constants/colors.dart';

enum TripCardVariant {
  classic,
  compact,
}

class TripCard extends StatelessWidget {
  final String busNumber;
  final String from;
  final String to;
  final String date;
  final Color badgeColor;
  final IconData badgeIcon;
  final TripCardVariant variant;

  const TripCard({
    Key? key,
    required this.busNumber,
    required this.from,
    required this.to,
    required this.date,
    required this.badgeColor,
    required this.badgeIcon,
    this.variant = TripCardVariant.classic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case TripCardVariant.compact:
        return _CompactTripCard(
          busNumber: busNumber,
          from: from,
          to: to,
          date: date,
          badgeColor: badgeColor,
          badgeIcon: badgeIcon,
        );

      case TripCardVariant.classic:
          return _ClassicTripCard(
            busNumber: busNumber,
            from: from,
            to: to,
            date: date,
            badgeColor: badgeColor,
            badgeIcon: badgeIcon,
          );
    }
  }
}
class _ClassicTripCard extends StatelessWidget {
  final String busNumber;
  final String from;
  final String to;
  final String date;
  final Color badgeColor;
  final IconData badgeIcon;

  const _ClassicTripCard({
    required this.busNumber,
    required this.from,
    required this.to,
    required this.date,
    required this.badgeColor,
    required this.badgeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 143,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [AppShadows.defaultShadow],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 17,
            left: 65,
            child: Container(
              width: 130,
              height: 39,
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(10.388),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 5.194,
                    offset: const Offset(5.194, 5.194),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(badgeIcon, size: 20, color: AppColors.barraTealDark),
                  const SizedBox(width: 8),
                  Text(
                    busNumber,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.barraTealDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 67,
            left: 38,
            right: 38,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    from,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.barraTealDark,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward),
                Expanded(
                  child: Text(
                    to,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: AppColors.barraTealDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                date,
                style: GoogleFonts.nunitoSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.barraTealDark,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 12,
            right: 12,
            child: Icon(Icons.star, color: AppColors.yellowStar),
          ),
        ],
      ),
    );
  }
}

class _CompactTripCard extends StatelessWidget {
  final String busNumber;
  final String from;
  final String to;
  final String date;
  final Color badgeColor;
  final IconData badgeIcon;

  const _CompactTripCard({
    required this.busNumber,
    required this.from,
    required this.to,
    required this.date,
    required this.badgeColor,
    required this.badgeIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [AppShadows.defaultShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(badgeIcon, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      busNumber,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.star, color: AppColors.yellowStar, size: 18),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '$from  ←  $to',
            style: GoogleFonts.nunitoSans(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.barraTealDark,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            date,
            style: GoogleFonts.nunitoSans(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
