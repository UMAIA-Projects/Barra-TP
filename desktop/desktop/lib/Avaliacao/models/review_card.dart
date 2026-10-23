import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final double rating;
  final String review;
  final String? avatarUrl;

  const ReviewCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.review,
    this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [AppShadows.defaultShadow],
      ),
      child: Row(
        children: [
          // Avatar
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(5.565),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 2.783,
                  ),
                ],
              ),
              child: avatarUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(5.565),
                      child: Image.network(
                        avatarUrl!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      Icons.person,
                      size: 40,
                      color: AppColors.barraTealDark,
                    ),
            ),
          ),
          // Content
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        review,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.barraTealDark,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _buildStarRating(),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  name,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.barraTealDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating() {
    return Column(
      children: [
        Icon(
          Icons.star,
          color: AppColors.yellowStar,
          size: 16,
        ),
        Text(
          rating.toStringAsFixed(1),
          style: GoogleFonts.nunitoSans(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: AppColors.barraTealDark,
          ),
        ),
      ],
    );
  }
}
