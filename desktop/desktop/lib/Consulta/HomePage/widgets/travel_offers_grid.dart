import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/routes.dart';

class TravelOffersGrid extends StatelessWidget {
  final List<Map<String, String>> offers = [
    {
      'from': 'Lisboa (todas as estações)',
      'to': 'Porto (Exponor)',
      'price': '6,95 €',
      'image':
          'https://api.builder.io/api/v1/image/assets/TEMP/af1facd36c955a94a5ef4d6d6a63c6bd74bb7d0f?width=700',
    },
    {
      'from': 'Porto (todas as estações)',
      'to': 'Braga',
      'price': '2,49 €',
      'image':
          'https://api.builder.io/api/v1/image/assets/TEMP/0805dc20ae1580b74a18e7f18f9be4e559d94293?width=700',
    },
    {
      'from': 'Coimbra',
      'to': 'Lisboa (Oriente)',
      'price': '4,99 €',
      'image':
          'https://cdn.builder.io/api/v1/image/assets%2F28ce9f0de2d14b38b27ab6ede44f6c4e%2F58bca56812294e7eaae1de8b8f56d487?format=webp&width=700',
    },
    {
      'from': 'Porto (todas as estações)',
      'to': 'Fátima',
      'price': '7,89 €',
      'image':
          'https://api.builder.io/api/v1/image/assets/TEMP/54da1a61b067e7aa293ff6ae4d0343352cbb2c50?width=700',
    },
    {
      'from': 'Coimbra',
      'to': 'Setúbal',
      'price': '5,85 €',
      'image':
          'https://api.builder.io/api/v1/image/assets/TEMP/6868f56dda14bc138d06c64d43c89ef00c059035?width=700',
    },
    {
      'from': 'Fátima',
      'to': 'Lisboa (Oriente)',
      'price': '3,99 €',
      'image':
          'https://api.builder.io/api/v1/image/assets/TEMP/f571026ca278e9f44e8d69a801bf5ffff7d64c8e?width=700',
    },
  ];

  TravelOffersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  'Sugestões de viagens',
                  style: GoogleFonts.nunitoSans(
                    color: AppColors.barraTeal,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Melhores ofertas do mês',
                  style: GoogleFonts.nunitoSans(
                    color: AppColors.barraTeal,
                    fontSize: 45,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            Spacer(),
            Padding(
                padding: EdgeInsets.only(top: 0),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.pesquisa);
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.barraTeal,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Pesquisa',
                            style: GoogleFonts.nunitoSans(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.search, color: Colors.white, size: 18),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 24),

        // Grid
        LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount;
            if (constraints.maxWidth < 600) {
              crossAxisCount = 2;
            } else {
              crossAxisCount = 3;
            }

            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                mainAxisExtent: 320,
              ),
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];
                return _TravelCard(
                  from: offer['from']!,
                  to: offer['to']!,
                  price: offer['price']!,
                  imageUrl: offer['image']!,
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _TravelCard extends StatelessWidget {
  final String from;
  final String to;
  final String price;
  final String imageUrl;

  const _TravelCard({
    required this.from,
    required this.to,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.pesquisa);
      },
      child: Column(
        children: [
          // Image Section
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 8,
                    right: 10,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.barraTeal,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'Desde $price',
                        style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Info Section
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.barraTeal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'De ',
                        style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: from,
                        style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Para ',
                        style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: to,
                        style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
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