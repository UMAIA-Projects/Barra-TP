import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/Aluguer/Aluguer/models/car.dart';
import 'package:desktop/constants/routes.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final int rentalDays;

  const CarCard({
    Key? key,
    required this.car,
    this.rentalDays = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalPrice = car.getTotalPrice(rentalDays);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section with category badge
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: car.image,
                      width: 180,
                      height: 140,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                        Container(color: AppColors.grey300),
                      errorWidget: (context, url, error) =>
                        Container(color: AppColors.grey300),
                    ),
                  ),
                  Positioned(
                    top: -8,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.barraTeal,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withValues(alpha: 0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        car.category,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'NunitoSans',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              // Details section
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      car.model,
                      style: TextStyle(
                        color: AppColors.barraTeal,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NunitoSans',
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Features in a compact grid
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        _FeatureItem(
                          icon: PhosphorIcons.users(),
                          label: '${car.passengers} Lugares',
                        ),
                        _FeatureItem(
                          icon: PhosphorIcons.gear(),
                          label: car.transmission,
                        ),
                        _FeatureItem(
                          icon: PhosphorIcons.suitcase(),
                          label: '${car.largeBags} Mala${car.largeBags > 1 ? 's' : ''} grande${car.largeBags > 1 ? 's' : ''}',
                        ),
                        _FeatureItem(
                          icon: PhosphorIcons.suitcaseRolling(),
                          label: '${car.smallBags} Mala${car.smallBags > 1 ? 's' : ''} pequena${car.smallBags > 1 ? 's' : ''}',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      color: AppColors.barraTeal.withValues(alpha: 0.3),
                      thickness: 1,
                    ),
                    const SizedBox(height: 12),
                    // Rating
                    Row(
                      children: [
                        Text(
                          car.rating.toString(),
                          style: TextStyle(
                            color: AppColors.barraTeal,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                        const SizedBox(width: 6),
                        PhosphorIcon(
                          PhosphorIcons.star(PhosphorIconsStyle.fill),
                          color: AppColors.barraTeal,
                          size: 24,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Price and action
              Container(
                constraints: BoxConstraints(minWidth: 160),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Preço para $rentalDays dias:',
                          style: TextStyle(
                            color: AppColors.grey600,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${totalPrice.toStringAsFixed(0)} €',
                          style: TextStyle(
                            color: AppColors.black87,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Material(
                      color: AppColors.barraTeal,
                      borderRadius: BorderRadius.circular(8),
                      elevation: 4,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.compraAluguer);
                        },
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 12,
                          ),
                          child: Text(
                            'Alugar',
                            style: TextStyle(
                              color: AppColors.white,                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NunitoSans',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final PhosphorIconData icon;
  final String label;

  const _FeatureItem({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        PhosphorIcon(
          icon,
          color: AppColors.barraTeal,
          size: 18,
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: AppColors.barraTeal,
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontFamily: 'NunitoSans',
          ),
        ),
      ],
    );
  }
}