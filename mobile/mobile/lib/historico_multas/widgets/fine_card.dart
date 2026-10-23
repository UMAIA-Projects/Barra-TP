import 'package:flutter/material.dart';
import '../models/fine.dart';
import '../theme/app_theme.dart';

class FineCardWidget extends StatelessWidget {
  final Fine fine;

  const FineCardWidget({
    Key? key,
    required this.fine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.brandTeal),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            color: Color.fromARGB(64, 0, 0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row: Title, Status, Date
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        'Multa ${fine.id}',
                        style: const TextStyle(
                          color: AppTheme.brandTeal,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'DaysOne',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                        decoration: BoxDecoration(
                          color: fine.isPaid ? AppTheme.brandSuccess : AppTheme.brandDanger,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          fine.isPaid ? 'Paga' : 'Não paga',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            height: 1.2,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Text(
                    'Data: ${fine.date}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: AppTheme.brandTextSecondary,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'NunitoSans',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Content row
            if (isMobile)
              _buildMobileContent()
            else
              _buildDesktopContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Transport and city
        Text(
          'Transporte: ${fine.transport}\nCidade: ${fine.city}',
          style: const TextStyle(
            color: AppTheme.brandTextSecondary,
            fontSize: 10,
            fontWeight: FontWeight.bold,
            height: 1.5,
            fontFamily: 'NunitoSans',
          ),
        ),
        const SizedBox(height: 8),
        // Reason
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Razão: ',
                style: TextStyle(
                  color: AppTheme.brandDanger,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'NunitoSans',
                ),
              ),
              TextSpan(
                text: '${fine.reason}\n${fine.ruleViolation}',
                style: const TextStyle(
                  color: AppTheme.brandTeal,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'NunitoSans',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Amount
        Align(
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Quantia:',
                style: TextStyle(
                  color: AppTheme.brandTeal,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'NunitoSans',
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.brandTeal,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  fine.amount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'NunitoSans',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Transport and city (left)
        Expanded(
          flex: 2,
          child: Text(
            'Transporte: ${fine.transport}\nCidade: ${fine.city}',
            style: const TextStyle(
              color: AppTheme.brandTextSecondary,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              height: 1.5,
              fontFamily: 'NunitoSans',
            ),
          ),
        ),
        // Reason (middle)
        Expanded(
          flex: 3,
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Razão: ',
                  style: TextStyle(
                    color: AppTheme.brandDanger,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NunitoSans',
                  ),
                ),
                TextSpan(
                  text: '${fine.reason}\n${fine.ruleViolation}',
                  style: const TextStyle(
                    color: AppTheme.brandTeal,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'NunitoSans',
                  ),
                ),
              ],
            ),
          ),
        ),
        // Amount (right)
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Quantia:',
                style: TextStyle(
                  color: AppTheme.brandTeal,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'NunitoSans',
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.brandTeal,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  fine.amount,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'NunitoSans',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
