import 'package:flutter/material.dart';
import 'package:desktop/constants/themes.dart';
import 'package:desktop/constants/colors.dart';

class PassFormWidget extends StatefulWidget {
  final String? selectedPass;

  const PassFormWidget({
    Key? key,
    this.selectedPass,
  }) : super(key: key);

  @override
  State<PassFormWidget> createState() => _PassFormWidgetState();
}

class _PassFormWidgetState extends State<PassFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  bool _savePayment = false;
  bool _allowNotifications = false;
  bool _acceptTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _cardNumberController.dispose();
    _postalCodeController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      debugPrint('Form submitted with:');
      debugPrint('Email: ${_emailController.text}');
      debugPrint('Full Name: ${_fullNameController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Comprar Passe Digital',
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
            // Email and Full Name
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Email is required';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: TextFormField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome Completo',
                      hintText: 'Nome Completo',
                    ),
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Full name is required';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Payment Methods Section
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.barraTeal, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    'Métodos de Pagamento',
                    style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  // Payment method icons grid
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
            ),
            const SizedBox(height: 24),
            // Card Details
            TextFormField(
              controller: _cardNumberController,
              decoration: const InputDecoration(
                labelText: 'Número do Cartão',
                hintText: 'Número do Cartão',
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _expiryDateController,
                    decoration: const InputDecoration(
                      labelText: 'Data de Validade',
                      hintText: 'Data de Validade',
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: TextFormField(
                    controller: _cvvController,
                    decoration: const InputDecoration(
                      labelText: 'CVV/CVC',
                      hintText: 'CVV/CVC',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _postalCodeController,
                    decoration: const InputDecoration(
                      labelText: 'Código Postal',
                      hintText: 'P012 1AB',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Checkboxes
            _CheckboxRow(
              label: 'Salvar este método de pagamento para finalizar compras futuras mais rapidamente.',
              value: _savePayment,
              onChanged: (value) {
                setState(() => _savePayment = value ?? false);
              },
            ),
            const SizedBox(height: 16),
            _CheckboxRow(
              label: 'Permitir que o Barra TP envie de notíficas e atualizações via email.',
              value: _allowNotifications,
              onChanged: (value) {
                setState(() => _allowNotifications = value ?? false);
              },
            ),
            const SizedBox(height: 16),
            _CheckboxRow(
              label: 'Concordo com os Termos de Serviço do BarraTP.',
              value: _acceptTerms,
              onChanged: (value) {
                setState(() => _acceptTerms = value ?? false);
              },
            ),
            const SizedBox(height: 32),
            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.barraTeal,
                ),
                child: Text(
                  'Pagar com Cartão de Crédito/Débito',
                  style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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

class _CheckboxRow extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _CheckboxRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
              color: AppColors.barraTeal,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}