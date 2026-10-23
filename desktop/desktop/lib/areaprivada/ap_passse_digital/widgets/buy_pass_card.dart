import 'package:flutter/material.dart';
import 'package:desktop/areaprivada/ap_passse_digital/models/pass.dart';
import 'package:desktop/constants/fonts.dart';
import 'package:desktop/constants/routes.dart';

class BuyPassCard extends StatelessWidget {
  const BuyPassCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comprar Passe',
            style: AppFonts.titleStyle,
          ),
          const SizedBox(height: 16),
          Divider(
            color: AppFonts.primaryColor,
            thickness: 4,
            height: 16,
          ),
          const SizedBox(height: 16),
          Text(
            'Tipos de passe:',
            style: AppFonts.bodyStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...passTypes.map((pass) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                pass.name,
                style: AppFonts.bodyStyle,
              ),
            );
          }),
          const SizedBox(height: 20),
          Divider(
            color: AppFonts.primaryColor,
            thickness: 4,
            height: 16,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.comprarPasse);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppFonts.primaryColor,
              ),
              child: Text(
                'Comprar Passe',
                style: AppFonts.buttonStyle,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'A sua conta tem acesso aos passes:',
            style: AppFonts.bodyStyle,
          ),
          const SizedBox(height: 8),
          ...userPasses.map((pass) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                pass.name,
                style: AppFonts.bodyStyle,
              ),
            );
          }),
        ],
      ),
    );
  }
}
