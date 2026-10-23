import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';

class SearchFormWidget extends StatefulWidget {
  const SearchFormWidget({super.key});

  @override
  State<SearchFormWidget> createState() => _SearchFormWidgetState();
}

class _SearchFormWidgetState extends State<SearchFormWidget> {
  bool isNational = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nacional/Internacional Toggle - alinhado à esquerda, mesma largura dos campos
        LayoutBuilder(
          builder: (context, constraints) {
            final availableWidth = constraints.maxWidth;
            final fieldWidth = availableWidth / 5;
            
            return SizedBox(
              width: fieldWidth,
              height: 40,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.barraTeal, width: 2),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: _ToggleButton(
                        label: 'Nacional',
                        isSelected: isNational,
                        onTap: () => setState(() => isNational = true),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6),
                          bottomLeft: Radius.circular(6),
                        ),
                      ),
                    ),
                    Expanded(
                      child: _ToggleButton(
                        label: 'Internacional',
                        isSelected: !isNational,
                        onTap: () => setState(() => isNational = false),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                          bottomRight: Radius.circular(6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 15),

        // Search Fields - todos com mesma largura e altura, em linha, estendendo de uma ponta a outra, sem espaços
        LayoutBuilder(
          builder: (context, constraints) {
            final availableWidth = constraints.maxWidth;
            final fieldWidth = availableWidth / 5;
            
            return Row(
              children: [
                _SearchField(
                  label: 'Selecione Origem',
                  width: fieldWidth,
                  height: 80,
                ),
                _SearchField(
                  label: 'Selecione Destino',
                  width: fieldWidth,
                  height: 80,
                ),
                _SearchField(
                  label: 'Data Início',
                  width: fieldWidth,
                  height: 80,
                ),
                _SearchField(
                  label: '+ Data Regresso',
                  width: fieldWidth,
                  height: 80,
                ),
                _PassengersField(
                  width: fieldWidth,
                  height: 80,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _ToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final BorderRadius borderRadius;

  const _ToggleButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.barraTeal : Colors.white,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.nunitoSans(
              color: isSelected ? Colors.white : AppColors.barraTeal,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  final String label;
  final double width;
  final double height;

  const _SearchField({
    required this.label,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.barraTeal, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.nunitoSans(
            color: AppColors.barraTeal,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _PassengersField extends StatelessWidget {
  final double width;
  final double height;

  const _PassengersField({
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.barraTeal, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Texto "1x Adulto" centrado
          Center(
            child: Text(
              '1x Adulto (30 a 60)',
              style: GoogleFonts.nunitoSans(
                color: AppColors.barraTeal,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Texto "Passageiros" no topo
          Positioned(
            top: 0,
            left: 0,
            child: Text(
              'Passageiros',
              style: GoogleFonts.nunitoSans(
                color: AppColors.barraTeal,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
