import 'package:flutter/material.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/Consulta/Compra/widgets/payment_form_section.dart';
import 'package:desktop/Consulta/Compra/widgets/order_summary_section.dart';

class CompraBilheteScreen extends StatelessWidget {
  const CompraBilheteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      activePage: 'Consulta',
      child: Padding(
        padding: const EdgeInsets.only(
          left: 32,
          right: 32,
          top: 0,
          bottom: 40,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: const PaymentFormSection(),
            ),
            const SizedBox(width: 24),
            SizedBox(
              width: 340,
              child: const OrderSummarySection(),
            ),
          ],
        ),
      ),
    );
  }
}
