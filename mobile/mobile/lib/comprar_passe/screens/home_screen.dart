import 'package:flutter/material.dart' hide TabBar;
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../models/app_state.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';
import '../../common/footer.dart';
import '../widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final maxWidth = isMobile ? double.infinity : 440.0;

    return Scaffold(
      body: Column(
        children: [
          const HeaderApp(),
          const SubHeader(label: 'Passe Digital'),
          const TabBar(),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      // Instructions section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Siga os passos para adquirir o seu passe',
                              style: BarraTheme.headingMedium,
                            ),
                            const SizedBox(height: 4),
                            const Divider(color: BarraColors.primary),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Pass type selection
                      _PassTypeSection(),
                      const SizedBox(height: 16),
                      // Document upload section
                      _DocumentUploadSection(),
                      const SizedBox(height: 16),
                      // Payment section
                      _PaymentSection(),
                      const SizedBox(height: 40),
                      const Footer(),
                    ],
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

class _PassTypeSection extends StatelessWidget {
  const _PassTypeSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        decoration: BoxDecoration(
          color: BarraColors.lightGrayBg50,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selecione um passe:',
              style: BarraTheme.headingMedium,
            ),
            const SizedBox(height: 4),
            const Divider(color: BarraColors.primary),
            const SizedBox(height: 8),
            Text(
              'Selecione uma opção:',
              style: BarraTheme.bodySmall.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 12),
            Consumer<AppState>(
              builder: (context, appState, _) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: passTypes.length,
                  itemBuilder: (context, index) {
                    final passType = passTypes[index];
                    final isSelected =
                        appState.selectedPassType == passType.id;
                    return _PassTypeCheckbox(
                      passType: passType,
                      isSelected: isSelected,
                      onSelected: () {
                        appState.selectPassType(passType.id);
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _PassTypeCheckbox extends StatelessWidget {
  final PassType passType;
  final bool isSelected;
  final VoidCallback onSelected;

  const _PassTypeCheckbox({
    required this.passType,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(
                color: BarraColors.primary,
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(4),
              boxShadow: isSelected
                  ? [
                      const BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ]
                  : [],
            ),
            child: isSelected
                ? Container(
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: BarraColors.primary,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              passType.label,
              style: BarraTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}

class _DocumentUploadSection extends StatelessWidget {
  const _DocumentUploadSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        decoration: BoxDecoration(
          color: BarraColors.lightGrayBg50,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: BarraColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                elevation: 2,
              ),
              child: Text(
                'Anexar Comprovativo',
                style: BarraTheme.buttonText.copyWith(fontSize: 9),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: BarraColors.primary,
                  width: 2,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      border: Border.all(color: BarraColors.primary),
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.download_for_offline,
                      color: BarraColors.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Clique para adicionar o seu comprovativo',
                    textAlign: TextAlign.center,
                    style: BarraTheme.bodySmall.copyWith(
                      fontSize: 9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentSection extends StatelessWidget {
  const _PaymentSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          // Payment methods
          Container(
            decoration: BoxDecoration(
              color: BarraColors.lightGrayBg50,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: BarraColors.primary, width: 2),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Métodos de Pagamento',
                  style: BarraTheme.headingMedium.copyWith(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Divider(color: BarraColors.primary),
                const SizedBox(height: 12),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  children: [
                    _PaymentMethodCard(label: 'PayPal'),
                    _PaymentMethodCard(label: 'Multibanco'),
                    _PaymentMethodCard(label: 'Bitcoin'),
                    _PaymentMethodCard(label: 'Google Pay'),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    context.read<AppState>().togglePaymentMethods();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BarraColors.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    'Ver Mais',
                    style: BarraTheme.buttonText.copyWith(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Payment form
          Container(
            decoration: BoxDecoration(
              color: BarraColors.lightGrayBg50,
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                _PaymentFormField(hintText: 'Email'),
                const SizedBox(height: 8),
                _PaymentFormField(hintText: 'Nome Completo'),
                const SizedBox(height: 8),
                _PaymentFormField(hintText: 'Número do Cartão:'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _PaymentFormField(hintText: 'P012 1AB'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          _PaymentFormField(hintText: 'Data de Validade:'),
                          const SizedBox(height: 8),
                          _PaymentFormField(hintText: 'CVV/CVC'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: BarraColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      'Comprar',
                      style: BarraTheme.buttonText.copyWith(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodCard extends StatelessWidget {
  final String label;

  const _PaymentMethodCard({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: BarraColors.primary, width: 0.8),
        borderRadius: BorderRadius.circular(2),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          label,
          style: BarraTheme.bodySmall.copyWith(fontSize: 11),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _PaymentFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const _PaymentFormField({
    required this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: BarraTheme.bodySmall.copyWith(
          color: BarraColors.primary.withValues(alpha: 0.7),
          fontSize: 12,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: BarraColors.primary,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: BarraColors.primary,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: BarraColors.primary,
            width: 2,
          ),
        ),
      ),
      style: BarraTheme.bodySmall.copyWith(fontSize: 12),
    );
  }
}
