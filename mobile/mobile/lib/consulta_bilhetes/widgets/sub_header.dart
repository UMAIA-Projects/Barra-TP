import 'package:flutter/material.dart';
import '../../descontos_disponiveis/constants/colors.dart';

class SubHeaderReturn extends StatelessWidget {
  const SubHeaderReturn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 34,
      color: AppColors.brandTealLight, // COR SUBHEADER solicitada
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Seta clássica do Google Icons
            const Icon(Icons.arrow_back, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            const Text(
              'Retornar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}