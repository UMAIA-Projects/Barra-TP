import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color brandColor = Color(0xFF365F67);

class PaymentForm extends StatefulWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _cardController = TextEditingController();
  final _postalController = TextEditingController(text: 'P012 1AB');
  final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _cardController.dispose();
    _postalController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFormField(
          controller: _emailController,
          label: 'Email',
          hint: 'Email',
        ),
        const SizedBox(height: 16),
        _buildFormField(
          controller: _nameController,
          label: 'Nome Completo',
          hint: 'Nome Completo',
        ),
        const SizedBox(height: 16),
        
        // NÚMERO DO CARTÃO com título e box de input
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Número do Cartão',
              style: GoogleFonts.nunitoSans(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: brandColor.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              constraints: const BoxConstraints(maxWidth: 177),
              child: TextField(
                controller: _cardController,
                style: GoogleFonts.nunitoSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: brandColor,
                ),
                decoration: InputDecoration(
                  hintText: 'Número do Cartão',
                  hintStyle: GoogleFonts.nunitoSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: brandColor.withOpacity(0.7),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: brandColor, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: brandColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: brandColor, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 16),
        
        // Linha com CÓDIGO POSTAL, DATA VALIDADE e CVV
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CÓDIGO POSTAL
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Código Postal',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: brandColor.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 4),
                _buildSmallInputField(
                  controller: _postalController,
                  hint: 'P012 1AB',
                  width: 111,
                ),
              ],
            ),
            
            const SizedBox(width: 16),
            
            // DATA DE VALIDADE
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data de Validade',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: brandColor.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 4),
                _buildSmallInputField(
                  controller: _expiryController,
                  hint: 'MM/AA',
                  width: 80,
                ),
              ],
            ),
            
            const SizedBox(width: 16),
            
            // CVV
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CVV/CVC',
                  style: GoogleFonts.nunitoSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: brandColor.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 4),
                _buildSmallInputField(
                  controller: _cvvController,
                  hint: '123',
                  width: 60,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 177),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.nunitoSans(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: brandColor.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            style: GoogleFonts.nunitoSans(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: brandColor,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.nunitoSans(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: brandColor.withOpacity(0.7),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: brandColor, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: brandColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: brandColor, width: 2),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallInputField({
    required TextEditingController controller,
    required String hint,
    required double width,
  }) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: brandColor, width: 2),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.nunitoSans(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: brandColor.withOpacity(0.7),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.nunitoSans(
            fontSize: 12,
            fontWeight: FontWeight.w800,
            color: brandColor.withOpacity(0.7),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}