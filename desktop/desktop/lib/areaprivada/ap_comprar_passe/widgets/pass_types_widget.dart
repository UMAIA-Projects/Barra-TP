import 'package:flutter/material.dart';
import 'package:desktop/constants/themes.dart';
import 'package:desktop/constants/colors.dart';

class PassTypesWidget extends StatelessWidget {
  final String? selectedPass;
  final ValueChanged<String> onPassSelected;

  const PassTypesWidget({
    Key? key,
    this.selectedPass,
    required this.onPassSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passTypes = [
      'Animália',
      'Jovem',
      'Estudante',
      'Sénior',
      'Trabalhador',
      'Militar',
      'Inclusivo',
      'Pessoal',
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Tipos de Passes',
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
              const SizedBox(height: 16),
              Container(
                height: 4,
                width: 260,
                decoration: BoxDecoration(
                  color: AppColors.barraTeal,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Select Pass Label
          Text(
            'Selecione um passe:',
            style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          // Pass Type Checkboxes
          Column(
            children: passTypes.map((passType) {
              final isSelected = selectedPass == passType;
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: GestureDetector(
                  onTap: () => onPassSelected(passType),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFF3F4F6)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: isSelected,
                            onChanged: (value) => onPassSelected(passType),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            passType,
                            style:
                                AppTheme.lightTheme.textTheme.labelLarge?.copyWith(
                              color: AppColors.barraTeal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          // Upload Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.barraTeal,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                'Anexar Comprovativo',
                style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Upload Area
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.barraTeal,
                width: 2,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(24),
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.barraTeal),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.upload_file,
                    color: AppColors.barraTeal,
                    size: 32,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Arraste aqui seu Comprovativo',
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: AppColors.barraTeal,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
