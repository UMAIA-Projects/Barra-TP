import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/station_.dart';

class StationCard extends StatefulWidget {
  final Station station;

  const StationCard({
    super.key,
    required this.station,
  });

  @override
  State<StationCard> createState() => _StationCardState();
}

class _StationCardState extends State<StationCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.station.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: const Color(0xFF365F67)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Station image
          Container(
            width: 120,
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                widget.station.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[400],
                    child: const Icon(Icons.image, color: Colors.grey),
                  );
                },
              ),
            ),
          ),
          
          // Station info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.station.name,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF365F67),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (widget.station.rating.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          widget.station.rating,
                          style: GoogleFonts.nunitoSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF365F67),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 10,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(${widget.station.reviewCount})',
                          style: GoogleFonts.nunitoSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w200,
                            color: const Color(0xFF365F67),
                          ),
                        ),
                      ],
                    ),
                  ],
                  const SizedBox(height: 4),
                  Text(
                    widget.station.type,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w200,
                      color: const Color(0xFF365F67),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          
          // Actions row
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                // Favorite button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Icon(
                    isFavorite ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 8),
                // Transport icon
                Icon(
                  widget.station.transportType == TransportType.metro
                      ? Icons.subway
                      : Icons.directions_bus,
                  color: const Color(0xFF365F67),
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}