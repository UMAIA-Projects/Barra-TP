import 'package:flutter/material.dart';

class ActivePassSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14, left: 16),
      width: 311,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Passe Ativo',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF475569),
            ),
          ),
          SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(6, 6),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Image.network(
                'https://api.builder.io/api/v1/image/assets/TEMP/1dca32a2114c2f154ebf894d9f79139a2093491d?placeholderIfAbsent=true&apiKey=6b10114f4e0d4c8a9eace5bf868b236c',
                width: 200,
                height: 137.2,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(width: 200, height: 137.2, color: Colors.grey[300]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
