import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SummaryWidget extends StatelessWidget {
  final int totalFines;
  final int paidCount;
  final int unpaidCount;
  final String totalAmount;
  final String accountStatus;

  const SummaryWidget({
    Key? key,
    required this.totalFines,
    required this.paidCount,
    required this.unpaidCount,
    required this.totalAmount,
    required this.accountStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          // Status indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 11,
                    color: AppTheme.brandSuccess,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Pagas: $paidCount',
                    style: const TextStyle(
                      color: AppTheme.brandTeal,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'NunitoSans',
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 48),
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 11,
                    color: AppTheme.brandDanger,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Não Pagas: $unpaidCount',
                    style: const TextStyle(
                      color: AppTheme.brandTeal,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'NunitoSans',
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Summary card
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9).withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nº Multas: $totalFines',
                          style: const TextStyle(
                            color: AppTheme.brandTeal,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                        Text(
                          'Estado da conta: $accountStatus',
                          style: const TextStyle(
                            color: AppTheme.brandTeal,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Viaje com segurança e precaução!',
                      style: TextStyle(
                        color: AppTheme.brandTeal,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'NunitoSans',
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 8,
                  bottom: -4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.brandTeal,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Total : $totalAmount',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'NunitoSans',
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
