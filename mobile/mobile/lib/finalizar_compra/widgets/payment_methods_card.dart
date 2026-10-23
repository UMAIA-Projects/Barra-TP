import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color brandColor = Color(0xFF365F67);

class PaymentMethodsCard extends StatelessWidget {
  const PaymentMethodsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: brandColor, width: 2),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(4, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Text(
            'Métodos de Pagamento',
            style: GoogleFonts.nunitoSans(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: brandColor,
            ),
          ),
          const SizedBox(height: 12),
          // Divider
          Divider(color: brandColor),
          const SizedBox(height: 16),
          // Payment icons grid
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildPaymentIcon(
                'https://api.builder.io/api/v1/image/assets/TEMP/57f666d4e8ba783292add24e6b25c402b93e3432',
                'PayPal',
                height: 45,
              ),
              _buildPaymentIcon(
                'https://api.builder.io/api/v1/image/assets/TEMP/c2e486f29c7c64d5772a91184796a5df2bd0cc7a',
                'Multibanco',
                height: 45,
              ),
              _buildPaymentIcon(
                'https://api.builder.io/api/v1/image/assets/TEMP/5816f69aeba6029c5d9b6b974b5bcaa66c6850ec',
                'Bitcoin',
                height: 44,
              ),
              _buildPaymentIcon(
                'https://api.builder.io/api/v1/image/assets/TEMP/76d1cb4b6c0ff3df0ea34f21b6b39d2c16e7bebb',
                'Google Pay',
                height: 33,
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Ver Mais button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: brandColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            ),
            child: Text(
              'Ver Mais',
              style: GoogleFonts.nunitoSans(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Usar Passe Digital button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: brandColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            ),
            child: Text(
              'Usar Passe Digital',
              style: GoogleFonts.nunitoSans(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentIcon(String imageUrl, String label, {required double height}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: brandColor, width: 1),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[200],
              child: Center(
                child: Text(label, style: const TextStyle(fontSize: 10)),
              ),
            );
          },
        ),
      ),
    );
  }
}
