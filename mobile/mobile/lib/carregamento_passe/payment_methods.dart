import 'package:flutter/material.dart';

class PaymentMethods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFF475569), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: Offset(4, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Métodos de Pagamento',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Color(0xFF475569),
            ),
          ),
          SizedBox(height: 4),
          Image.network(
            'https://api.builder.io/api/v1/image/assets/TEMP/58c2222d88b91619a9cb216ec9738ba9089e18ec?placeholderIfAbsent=true&apiKey=6b10114f4e0d4c8a9eace5bf868b236c',
            width: 176,
            height: 1,
            errorBuilder: (context, error, stackTrace) => Container(width: 176, height: 1, color: Color(0xFF475569)),
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                'https://api.builder.io/api/v1/image/assets/TEMP/2be3d88ab37760190ad56b18d619f0567d985f3a?placeholderIfAbsent=true&apiKey=6b10114f4e0d4c8a9eace5bf868b236c',
                width: 60,
                height: 40,
                errorBuilder: (context, error, stackTrace) => Container(width: 63, height: 41, color: Colors.grey[300]),
              ),
              SizedBox(width: 40),
              Image.network(
                'https://api.builder.io/api/v1/image/assets/TEMP/adcf1a136c2429044b24ce07017491197c8311c4?placeholderIfAbsent=true&apiKey=6b10114f4e0d4c8a9eace5bf868b236c',
                width: 46,
                height: 46,
                errorBuilder: (context, error, stackTrace) => Container(width: 47, height: 47, color: Colors.grey[300]),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                'https://api.builder.io/api/v1/image/assets/TEMP/e6d07ebfecc07912cb29995a445d3fecbf590600?placeholderIfAbsent=true&apiKey=6b10114f4e0d4c8a9eace5bf868b236c',
                width: 45,
                height: 45,
                errorBuilder: (context, error, stackTrace) => Container(width: 46, height: 46, color: Colors.grey[300]),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    child: Image.network(
                      'https://api.builder.io/api/v1/image/assets/TEMP/4f10b1fa589939304fb38c259b3009bd0a033081?placeholderIfAbsent=true&apiKey=6b10114f4e0d4c8a9eace5bf868b236c',
                      width: 48,
                      height: 33,
                      errorBuilder: (context, error, stackTrace) => Container(width: 50, height: 35, color: Colors.grey[300]),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Container(
            width: 92,
            height: 23,
            decoration: BoxDecoration(
              color: Color(0xFF475569),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Ver Mais',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
