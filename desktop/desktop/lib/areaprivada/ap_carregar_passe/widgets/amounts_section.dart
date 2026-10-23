import 'package:flutter/material.dart';
import 'package:desktop/constants/themes.dart';

class AmountsSection extends StatelessWidget {
  final String selectedAmount;
  final ValueChanged<String> onAmountSelected;

  const AmountsSection({
    Key? key,
    required this.selectedAmount,
    required this.onAmountSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Montantes',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
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
            const SizedBox(height: 8),
            Container(
              height: 3,
              width: 80,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 16),
            
            // Selection Label
            const Text(
              'Selecione uma opção:',
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textColor,
              ),
            ),
            const SizedBox(height: 16),
            
            // Amount Options
            _AmountOption(
              amount: '5€',
              groupValue: selectedAmount,
              onTap: () => onAmountSelected('5€'),
            ),
            const SizedBox(height: 8),
            _AmountOption(
              amount: '20€',
              groupValue: selectedAmount,
              onTap: () => onAmountSelected('20€'),
            ),
            const SizedBox(height: 8),
            _AmountOption(
              amount: '50€',
              groupValue: selectedAmount,
              onTap: () => onAmountSelected('50€'),
            ),
            const SizedBox(height: 8),
            _AmountOption(
              amount: '100€',
              groupValue: selectedAmount,
              onTap: () => onAmountSelected('100€'),
            ),
            const SizedBox(height: 8),
            _AmountOption(
              amount: '500€',
              groupValue: selectedAmount,
              onTap: () => onAmountSelected('500€'),
            ),
            const SizedBox(height: 8),
            _AmountOption(
              amount: 'Personalizado',
              groupValue: selectedAmount,
              onTap: () => onAmountSelected('Personalizado'),
            ),
            const SizedBox(height: 24),
            
            // Divider
            Container(
              height: 3,
              width: 80,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 24),
            
            // Info Text
            const Text(
              'Remembramos que o seu passe fica inativo até ao seu próximo carregamento se não o carregar mensalmente.',
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textColor,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Carregar mais de 5€ oferece-lhe uma chance de ganhar o nosso sorteio de 50.000€',
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AmountOption extends StatelessWidget {
  final String amount;
  final String groupValue;
  final VoidCallback onTap;

  const _AmountOption({
    required this.amount,
    required this.groupValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = groupValue == amount;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFF3F4F6) // fundo quando selecionado
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // 🔲 QUADRADO CUSTOM
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? AppTheme.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(4), // cantos arredondados
                border: Border.all(
                  color: AppTheme.primaryColor,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                amount,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
