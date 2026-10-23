import 'package:flutter/material.dart';

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 325,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Map image
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              'https://api.builder.io/api/v1/image/assets/TEMP/f2cb6d3493081b4e1d6468f19fdb98575bfc4692?width=844',
              width: double.infinity,
              height: 325,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.map, size: 50, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          // Fullscreen button
          Positioned(
            right: 8,
            bottom: 8,
            child: GestureDetector(
              onTap: () {
                // Handle fullscreen
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.fullscreen,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          // Current location marker
          Positioned(
            left: 154,
            top: 123,
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}