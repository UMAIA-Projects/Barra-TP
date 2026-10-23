import 'package:flutter/material.dart';
import 'package:desktop/constants/themes.dart';

class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Resumo do Pedido',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppTheme.textColor,
                shadows: [
                  Shadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Container(
              height: 2.5,
              width: 70,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 20),
            
            _SummaryRow(
              label: 'Viagem:',
              value: 'Lisboa (Oriente) → Porto (Campanhã)',
              fontSize: 13,
            ),
            const SizedBox(height: 12),
            _SummaryRow(
              label: 'Data:',
              value: 'Qua, 08-12-2025',
              fontSize: 13,
            ),
            const SizedBox(height: 12),
            _SummaryRow(
              label: 'Hora:',
              value: '15:30 - 18:50',
              fontSize: 13,
            ),
            const SizedBox(height: 12),
            _SummaryRow(
              label: 'Passageiros:',
              value: '1x Adulto (20 a 64)',
              fontSize: 13,
            ),
            const SizedBox(height: 20),
            
            Container(
              height: 1.5,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 16),
            
            _SummaryRow(
              label: 'Subtotal:',
              value: '7,50€',
              isBold: true,
              fontSize: 14,
            ),
            const SizedBox(height: 8),
            _SummaryRow(
              label: 'Taxas:',
              value: '0,00€',
              fontSize: 13,
            ),
            const SizedBox(height: 12),
            Container(
              height: 1.5,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 12),
            _SummaryRow(
              label: 'Total:',
              value: '7,50€',
              isBold: true,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final double fontSize;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.isBold = false,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: AppTheme.textColor,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: AppTheme.textColor,
            ),
          ),
        ),
      ],
    );
  }
}