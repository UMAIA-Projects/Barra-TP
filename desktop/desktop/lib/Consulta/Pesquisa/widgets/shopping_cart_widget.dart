import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/Consulta/Compra/screens/compra_bilhete_screen.dart';

class ShoppingCartWidget extends StatelessWidget {
  const ShoppingCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF475569), width: 2),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.barraTeal,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // O título agora pode encolher e fazer ellipsis para evitar overflow.
                const Expanded(
                  child: Text(
                    'Carrinho',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                // Agrupamos o ícone e a hora em um Row compacto.
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      "https://api.builder.io/api/v1/image/assets/TEMP/a5ce82257da2f59a39cc8223b6a0ac66e662b340?placeholderIfAbsent=true&apiKey=8d7cc46f0fec419ea078309afe54e911",
                      width: 24,
                      height: 24,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.access_time, size: 24, color: Colors.white);
                      },
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '10:00',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Content
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16), // Mesmo padding do header
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 600) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Main content section
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              const Text(
                                'Qua, 08-12-2025',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF475569),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '15:30 ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'Lisboa (Oriente)',
                                      style: TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                    TextSpan(text: '\n'),
                                    TextSpan(
                                      text: '18:50 ',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'Porto (Campanhã)',
                                      style: TextStyle(fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF6B7280),
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                '\n1x Adulto (20 a 64)\n',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: const Color(0xFF475569), width: 2),
                                ),
                                child: const Text(
                                  'Convidar Amigo',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF475569),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Preço',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF475569),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Price and close button section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: ColorFiltered(
                                      colorFilter: ColorFilter.mode(Color(0xFFF52424), BlendMode.srcIn), // Vermelho
                                      child: Image.network(
                                        "https://api.builder.io/api/v1/image/assets/TEMP/d5f598f72a73597adc531ce229a09b7745976ccc?placeholderIfAbsent=true&apiKey=8d7cc46f0fec419ea078309afe54e911",
                                        width: 24,
                                        height: 24,
                                        errorBuilder: (context, error, stackTrace) {
                                          return Icon(Icons.close, size: 24, color: Color(0xFFF52424)); // Vermelho
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                '7,50€',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF475569),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      // Original layout for wider screens
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                const Text(
                                  'Qua, 08-12-2025',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF475569),
                                  ),
                                ),
                                const SizedBox(height: 28),
                                const Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '15:30 ',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: 'Lisboa (Oriente)',
                                        style: TextStyle(fontWeight: FontWeight.w500),
                                      ),
                                      TextSpan(text: '\n'),
                                      TextSpan(
                                        text: '18:50 ',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: 'Porto (Campanhã)',
                                        style: TextStyle(fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF6B7280),
                                    height: 1.4,
                                  ),
                                ),
                                const SizedBox(height: 28),
                                const Text(
                                  '\n1x Adulto (20 a 64)\n',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF6B7280),
                                  ),
                                ),
                                const SizedBox(height: 28),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: const Color(0xFF475569), width: 2),
                                  ),
                                  child: const Text(
                                    'Convidar Amigo',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFF475569),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 32),
                                const Text(
                                  'Preço',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF475569),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: ColorFiltered(
                                  colorFilter: ColorFilter.mode(Color(0xFFF52424), BlendMode.srcIn), // Vermelho
                                  child: Image.network(
                                    "https://api.builder.io/api/v1/image/assets/TEMP/d5f598f72a73597adc531ce229a09b7745976ccc?placeholderIfAbsent=true&apiKey=8d7cc46f0fec419ea078309afe54e911",
                                    width: 30,
                                    height: 30,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(Icons.close, size: 30, color: Color(0xFFF52424)); // Vermelho
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 192),
                              const Text(
                                '7,50€',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF475569),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                  },
                ),
                const SizedBox(height: 8),
                Image.network(
                  "https://api.builder.io/api/v1/image/assets/TEMP/20de851455392a2825195de49798dd1bf5f12e22?placeholderIfAbsent=true&apiKey=8d7cc46f0fec419ea078309afe54e911",
                  width: double.infinity,
                  height: 2,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(width: double.infinity, height: 2, color: Color(0xFF475569));
                  },
                ),
                const SizedBox(height: 12),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Total: 7,50€',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF475569),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const CompraBilheteScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF475569),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Prosseguir',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
