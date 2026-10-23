import 'package:flutter/material.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';
import 'digital_pass_section.dart';
import 'active_pass_section.dart';
import 'amount_selection.dart';
import 'payment_section.dart';

class CarregamentoPasse extends StatefulWidget {
  @override
  _CarregamentoPasseState createState() => _CarregamentoPasseState();
}

class _CarregamentoPasseState extends State<CarregamentoPasse> {
  final GlobalKey<DigitalPassSectionState> _digitalPassKey = GlobalKey<DigitalPassSectionState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: 480),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFF475569)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                HeaderApp(),
                DigitalPassSection(key: _digitalPassKey),
                ActivePassSection(),
                AmountSelection(),

                Container(
                  margin: EdgeInsets.only(top: 6),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Remembramos que o seu passe fica inativo até ao seu próximo carregamento se não o carregar mensalmente.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF475569),
                    ),
                  ),
                ),

                PaymentSection(
                  onPaymentComplete: () {
                    _digitalPassKey.currentState?.updatePaymentStatus();
                  },
                ),

                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(bottom: 1.8), // Margem para compensar o overflow
                  child: Image.network(
                    'https://api.builder.io/api/v1/image/assets/TEMP/535cbe9f625657bcfb2e338fc1dac55904cc002a?placeholderIfAbsent=true&apiKey=6b10114f4e0d4c8a9eace5bf868b236c',
                    width: double.infinity,
                    height: 69.2, // Reduzido 1.8px para evitar overflow
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: double.infinity, 
                      height: 69.2, // Altura reduzida correspondente
                      color: Colors.grey[300]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(currentIndex: 3),
    );
  }
}