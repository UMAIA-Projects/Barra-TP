import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/themes.dart';


class RentalForm extends StatefulWidget {
  final double total;

  const RentalForm({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  State<RentalForm> createState() => _RentalFormState();
}

class _PaymentMethodCard extends StatelessWidget {
  final String image;

  const _PaymentMethodCard({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.barraTeal),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Image.network(
            image,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
      ),
    );
  }
}

class _RentalFormState extends State<RentalForm> {
  late TextEditingController emailController;
  late TextEditingController fullNameController;
  late TextEditingController cardNumberController;
  late TextEditingController postalCodeController;
  late TextEditingController validityDateController;
  late TextEditingController cvvController;

  bool savePaymentMethod = false;
  bool allowNotifications = false;
  bool agreeTerms = false;

  final paymentMethods = [
    ('https://api.builder.io/api/v1/image/assets/TEMP/c680b76ec9eb542eb7c1a16c3a98a5b0f661eabd?width=223'),
    ('https://api.buil der.io/api/v1/image/assets/TEMP/97dba5ef0c700f3a08e976b124585d87d51cae66?width=50'),
    ('https://api.builder.io/api/v1/image/assets/TEMP/ac640c44df301f55efc91a02806490bb1100886b?width=143'),
    ('https://api.builder.io/api/v1/image/assets/TEMP/9edec09e4f3f43a6b91d0532fb8900dd6a232d09?width=223'),
    ('https://api.builder.io/api/v1/image/assets/TEMP/81b918ea2628eff34498eaf0f7002048b3959236?width=573'),
  ];

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    fullNameController = TextEditingController();
    cardNumberController = TextEditingController();
    postalCodeController = TextEditingController();
    validityDateController = TextEditingController();
    cvvController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    fullNameController.dispose();
    cardNumberController.dispose();
    postalCodeController.dispose();
    validityDateController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Alugar Carro',
              style: TextStyle(
                fontFamily: 'NunitoSans',
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: AppColors.barraTeal,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 4,
              color: AppColors.barraTeal,
            ),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      _buildTextField('Email', emailController),
                      const SizedBox(height: 24),
                      _buildPaymentMethods(),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                Expanded(
                  child: Column(
                    children: [
                      _buildTextField('Nome Completo', fullNameController),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: _buildTextField(
                              'Número do Cartão',
                              cardNumberController,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildTextField(
                              'Código Postal',
                              postalCodeController,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField(
                              'Data de Validade',
                              validityDateController,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildTextField(
                              'CVV/CVC',
                              cvvController,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      _buildCheckboxes(),
                      const SizedBox(height: 24),
                      _buildPayButton(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          fontFamily: 'NunitoSans',
          fontSize: 15,
          fontWeight: FontWeight.w800,
          color: AppColors.barraTeal,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.barraTeal,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.barraTeal,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.barraTeal,
            width: 2,
          ),
        ),
      ),
      style: const TextStyle(
        fontFamily: 'NunitoSans',
        fontSize: 15,
        color: AppColors.barraTeal,
      ),
    );
  }

  Widget _buildPaymentMethods() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.barraTeal, width: 2),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Métodos de Pagamento',
            style: TextStyle(
              fontFamily: 'NunitoSans',
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: AppColors.barraTeal,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                      _PaymentMethodCard(image: 'https://api.builder.io/api/v1/image/assets/TEMP/c680b76ec9eb542eb7c1a16c3a98a5b0f661eabd?width=223'),
                      _PaymentMethodCard(image: 'https://api.builder.io/api/v1/image/assets/TEMP/97dba5ef0c700f3a08e976b124585d87d51cae66?width=100'),
                      _PaymentMethodCard(image: 'https://api.builder.io/api/v1/image/assets/TEMP/ac640c44df301f55efc91a02806490bb1100886b?width=143'),
                      _PaymentMethodCard(image: 'https://api.builder.io/api/v1/image/assets/TEMP/9edec09e4f3f43a6b91d0532fb8900dd6a232d09?width=223'),
                      
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Visa/Mastercard card
                  Container(
                    height: 112,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.barraTeal),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Image.network(
                        'https://api.builder.io/api/v1/image/assets/TEMP/81b918ea2628eff34498eaf0f7002048b3959236?width=573',
                        width: 150,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // See More Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.barraTeal,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: Text(
                        'Ver Mais',
                        style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
          ),
        ),
      ],
      ),
    );
  }

  Widget _buildCheckboxes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCheckboxRow(
          'Salvar este método de pagamento para finalizar compras futuras mais rapidamente.',
          savePaymentMethod,
          (value) => setState(() => savePaymentMethod = value ?? false),
        ),
        const SizedBox(height: 16),
        _buildCheckboxRow(
          'Permitir que o Barra TP envie de notícias e atualizações via email.',
          allowNotifications,
          (value) => setState(() => allowNotifications = value ?? false),
        ),
        const SizedBox(height: 16),
        _buildCheckboxRow(
          'Concordo com os Termos de Serviço do BarraTP.',
          agreeTerms,
          (value) => setState(() => agreeTerms = value ?? false),
        ),
      ],
    );
  }

  Widget _buildCheckboxRow(
    String text,
    bool value,
    Function(bool?) onChanged,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          side: const BorderSide(
            color: AppColors.barraTeal,
            width: 2,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'NunitoSans',
                fontSize: 14,
                color: AppColors.barraTeal,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPayButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.barraTeal,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        'Pagar ${widget.total.toStringAsFixed(2)}€ com Cartão de Crédito/Débito',
        style: const TextStyle(
          fontFamily: 'NunitoSans',
          fontSize: 15,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    );
  }
}
