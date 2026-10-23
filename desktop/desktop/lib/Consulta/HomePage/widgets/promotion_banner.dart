import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/routes.dart';

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 32,
        left: 32,
        right: 32,
        bottom: 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.barraTeal,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adere ao Barra TP hoje e começa a poupar imediatamente',
                  style: GoogleFonts.nunitoSans(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Oferecemos-te várias vantagens e ofertas especiais. Aproveita e adere ao nosso passe online!\nBasta fazeres login para começar a poupar logo na tua primeira viagem.',
                  style: GoogleFonts.nunitoSans(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _BulletPoint('Descontos em viagens até 70%'),
                    SizedBox(height: 4),
                    _BulletPoint('Vantagens e benefícios dos nossos parceiros'),
                    SizedBox(height: 4),
                    _BulletPoint(
                        'Histórico de bilhetes e faturas na tua área pessoal'),
                  ],
                ),
                SizedBox(height: 0),
                Transform.translate(
                  offset: Offset(0, -36),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 520),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.comprarPasse);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            'Adere já',
                            style: GoogleFonts.nunitoSans(
                              color: AppColors.barraTeal,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 24),
              child: Container(
                width: 300,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://api.builder.io/api/v1/image/assets/TEMP/144c8236d20a2be08cc0ea009d5ebdddb74e6dea?width=594',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 6, top: 2),
          child: Text(
            '•',
            style: GoogleFonts.nunitoSans(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.nunitoSans(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}