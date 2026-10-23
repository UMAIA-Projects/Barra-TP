import 'package:flutter/material.dart';
import 'package:desktop/constants/themes.dart';

class PaymentFormSection extends StatefulWidget {
  const PaymentFormSection({Key? key}) : super(key: key);

  @override
  State<PaymentFormSection> createState() => _PaymentFormSectionState();
}

class _PaymentFormSectionState extends State<PaymentFormSection> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final cardController = TextEditingController();
  final expiryController = TextEditingController();
  final postalController = TextEditingController();
  final cvvController = TextEditingController();

  bool saveMethod = false;
  bool allowNotifications = false;
  bool agreeTerms = false;

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    cardController.dispose();
    expiryController.dispose();
    postalController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Comprar Bilhete',
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
                width: 100,
                color: AppTheme.primaryColor,
              ),
              const SizedBox(height: 24),
              
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              LayoutBuilder(
                builder: (context, constraints) {
                  // Verifica se há espaço suficiente para layout horizontal
                  if (constraints.maxWidth > 700) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 45,
                          child: _PaymentMethodsCard(),
                        ),
                        const SizedBox(width: 20),
                        Flexible(
                          flex: 55,
                          child: _PaymentFields(
                            nameController: nameController,
                            cardController: cardController,
                            expiryController: expiryController,
                            postalController: postalController,
                            cvvController: cvvController,
                          ),
                        ),
                      ],
                    );
                  }
                  
                  // Layout vertical para telas menores
                  return Column(
                    children: [
                      _PaymentMethodsCard(),
                      const SizedBox(height: 20),
                      _PaymentFields(
                        nameController: nameController,
                        cardController: cardController,
                        expiryController: expiryController,
                        postalController: postalController,
                        cvvController: cvvController,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),
              
              _CheckboxOption(
                value: saveMethod,
                onChanged: (val) => setState(() => saveMethod = val ?? false),
                text: 'Salvar este método de pagamento para finalizar compras futuras mais rapidamente.',
              ),
              const SizedBox(height: 12),
              _CheckboxOption(
                value: allowNotifications,
                onChanged: (val) => setState(() => allowNotifications = val ?? false),
                text: 'Permitir que o Barra TP envie de notícias e atualizações via email.',
              ),
              const SizedBox(height: 12),
              _CheckboxOption(
                value: agreeTerms,
                onChanged: (val) => setState(() => agreeTerms = val ?? false),
                text: 'Concordo com os Termos de Serviço do BarraTP.',
              ),
              const SizedBox(height: 24),
              
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Pagar com Cartão de Crédito/Débito',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PaymentFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController cardController;
  final TextEditingController expiryController;
  final TextEditingController postalController;
  final TextEditingController cvvController;

  const _PaymentFields({
    required this.nameController,
    required this.cardController,
    required this.expiryController,
    required this.postalController,
    required this.cvvController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: 'Nome Completo',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        TextField(
          controller: cardController,
          decoration: InputDecoration(
            hintText: 'Número do Cartão',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        TextField(
          controller: expiryController,
          decoration: InputDecoration(
            hintText: 'Data de Validade',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppTheme.primaryColor,
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: postalController,
                decoration: InputDecoration(
                  hintText: 'Código Postal',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: cvvController,
                decoration: InputDecoration(
                  hintText: 'CVV/CVC',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppTheme.primaryColor,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PaymentMethodsCard extends StatelessWidget {
  const _PaymentMethodsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Métodos de Pagamento',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
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
          const SizedBox(height: 10),
          
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: 1.3,
            children: [
              _PaymentIconButton('https://api.builder.io/api/v1/image/assets/TEMP/c680b76ec9eb542eb7c1a16c3a98a5b0f661eabd?width=223'),
              _PaymentIconButton('https://api.builder.io/api/v1/image/assets/TEMP/97dba5ef0c700f3a08e976b124585d87d51cae66?width=143'),
              _PaymentIconButton('https://api.builder.io/api/v1/image/assets/TEMP/ac640c44df301f55efc91a02806490bb1100886b?width=143'),
              _PaymentIconButton('https://api.builder.io/api/v1/image/assets/TEMP/9edec09e4f3f43a6b91d0532fb8900dd6a232d09?width=223'),
            ],
          ),
          const SizedBox(height: 10),
          
          Container(
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.network(
              'https://api.builder.io/api/v1/image/assets/TEMP/81b918ea2628eff34498eaf0f7002048b3959236?width=573',
              width: 100,
              height: 80,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.qr_code, size: 40, color: AppTheme.primaryColor),
            ),
          ),
          const SizedBox(height: 10),
          
          SizedBox(
            width: double.infinity,
            height: 32,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Ver Mais',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentIconButton extends StatelessWidget {
  final String image;

  const _PaymentIconButton(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primaryColor, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              image,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => 
                const Icon(Icons.payment, color: AppTheme.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}

class _CheckboxOption extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String text;

  const _CheckboxOption({
    required this.value,
    required this.onChanged,
    required this.text,
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
            side: const BorderSide(color: AppTheme.primaryColor, width: 1.5),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textColor,
            ),
          ),
        ),
      ],
    );
  }
}