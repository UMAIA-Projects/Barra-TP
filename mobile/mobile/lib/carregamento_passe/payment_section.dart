import 'package:flutter/material.dart';
import 'payment_methods.dart';
import 'payment_form.dart';
import '../../passes/screens/home_screen.dart' as PassesScreen;

class PaymentSection extends StatelessWidget {
  final VoidCallback? onPaymentComplete;

  const PaymentSection({Key? key, this.onPaymentComplete}) : super(key: key);

  void _handlePayment(BuildContext context) {
    if (onPaymentComplete != null) {
      onPaymentComplete!();
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const PassesScreen.HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 14),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      width: double.infinity,
      constraints: BoxConstraints(maxWidth: 415),
      decoration: BoxDecoration(
        color: Color(0xFF71717A).withOpacity(0.5),
      ),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              // Se a largura for muito pequena, empilha verticalmente
              if (constraints.maxWidth < 350) {
                return Column(
                  children: [
                    PaymentMethods(),
                    SizedBox(height: 16),
                    PaymentForm(),
                  ],
                );
              }
              
              // Caso contrário, usa Row
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 55,
                    child: PaymentMethods(),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    flex: 45,
                    child: PaymentForm(),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () => _handlePayment(context),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Color(0xFF365F67),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Text(
                  'Pagar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
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