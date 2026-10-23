import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/constants/responsive_utils.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/Avaliacao/models/review_card.dart';
import 'package:desktop/Avaliacao/models/trip_card.dart';

class AvaliacaoScreen extends StatefulWidget {
  const AvaliacaoScreen({super.key});

  @override
  State<AvaliacaoScreen> createState() => _AvaliacaoScreenState();
}

class _AvaliacaoScreenState extends State<AvaliacaoScreen> {
  final TextEditingController siteReviewController = TextEditingController();
  final TextEditingController tripReviewController = TextEditingController();

  final reviews = [
    {
      'name': 'Diogo M.',
      'rating': 5.0,
      'review':
          '"Site muito iterativo, fácil de entender onde posso achar tudo o que eu estou à procura."',
      'avatar':
          'https://api.builder.io/api/v1/image/assets/TEMP/1f7f1dff8cfd01199376d9b9b722ce936068cd83',
    },
    {
      'name': 'Joana D.',
      'rating': 4.2,
      'review':
          '"Uso este site sempre que preciso de planear uma viagem de autocarro ou metro."',
      'avatar':
          'https://api.builder.io/api/v1/image/assets/TEMP/68d9c1f34dfa1ae4a9f1fff912197f50a0e718c9',
    },
  ];

  final trips = [
    {
      'busNumber': 'IC',
      'from': 'Pombal',
      'to': 'Espinho',
      'date': '04/03/2025',
      'badgeColor': AppColors.greenBright2,
      'badgeIcon': Icons.train,
    },
    {
      'busNumber': '203',
      'from': 'Marquês',
      'to': 'Bessa',
      'date': '23/04/2025',
      'badgeColor': AppColors.blueBright,
      'badgeIcon': Icons.directions_bus,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;

    return BaseScreen(
      activePage: 'Avaliação',
      showSearchBar: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.spacing(40),
          vertical: responsive.spacing(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// coluna esquerda
            Expanded(
              flex: 65,
              child: _MainContent(
                reviews: reviews,
                controller: siteReviewController,
              ),
            ),
            SizedBox(width: responsive.spacing(40)),

            /// coluna direita
            Expanded(
              flex: 35,
              child: _RightSidebar(
                trips: trips,
                controller: tripReviewController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _MainContent extends StatelessWidget {
  final List reviews;
  final TextEditingController controller;

  const _MainContent({
    required this.reviews,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [AppShadows.defaultShadow],
      ),
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Avalie o nosso Site',
            style: GoogleFonts.nunitoSans(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: AppColors.barraTealDark,
            ),
          ),
          const SizedBox(height: 8),
          Container(height: 2, color: AppColors.barraTealDark),
          const SizedBox(height: 24),

          //campo editável
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [AppShadows.defaultShadow],
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Avalie a sua experiência com o nosso site!',
                filled: true,
                fillColor: Colors.white,

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),

                //estrelas dentro do campo
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        color: AppColors.yellowStar,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ),

          const SizedBox(height: 32),

          Text(
            'Avaliações de outros utilizadores:',
            style: GoogleFonts.nunitoSans(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.barraTealDark,
            ),
          ),
          const SizedBox(height: 24),

          ...reviews.map(
            (r) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: ReviewCard(
                name: r['name'],
                rating: r['rating'],
                review: r['review'],
                avatarUrl: r['avatar'],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RightSidebar extends StatelessWidget {
  final List trips;
  final TextEditingController controller;

  const _RightSidebar({
    required this.trips,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [AppShadows.defaultShadow],
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'As suas Viagens',
            style: GoogleFonts.nunitoSans(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AppColors.barraTealDark,
            ),
          ),
          const SizedBox(height: 8),
          Container(height: 2, color: AppColors.barraTealDark),
          const SizedBox(height: 32),

          ...trips.map(
            (trip) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: TripCard(
                busNumber: trip['busNumber'],
                from: trip['from'],
                to: trip['to'],
                date: trip['date'],
                badgeColor: trip['badgeColor'],
                badgeIcon: trip['badgeIcon'],
              ),
            ),
          ),

          const SizedBox(height: 8),

          //campo editável das viagens
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [AppShadows.defaultShadow],
            ),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Avalie suas viagens...',
                filled: true,
                fillColor: Colors.white,

                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 18,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),

                //estrelas dentro do campo
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        color: AppColors.yellowStar,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}