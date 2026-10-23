import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/constants/colors.dart';

class DefinicoesScreen extends StatelessWidget {
  const DefinicoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      activePage: 'Definições',
      showSearchBar: false,
      child: const _SettingsContent(),
    );
  }
}

class _SettingsContent extends StatelessWidget {
  const _SettingsContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 700),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title('Definições'),
              const SizedBox(height: 20),
              _divider(),
              const SizedBox(height: 32),

              _settingRow('Filtro de letra: Nunito Sans', 'Alterar'),
              _settingRow('Modo escuro', 'Ativar'),
              _settingRow('Contraste', 'Editar'),
              _settingRow('Cookies', 'Eliminar'),
              _settingRow('Cache', 'Eliminar', isLast: true),

              const SizedBox(height: 40),
              _divider(),
              const SizedBox(height: 32),

              _title('Bugs e Problemas Técnicos'),
              const SizedBox(height: 24),
              _settingRow(
                'Comunicar Problemas Técnicos / Feedback',
                'Enviar',
                isLast: true,
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(String text) {
    return Text(
      text,
      style: GoogleFonts.nunitoSans(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: AppColors.barraTeal,
        shadows: [
          Shadow(
            offset: const Offset(0, 4),
            blurRadius: 4,
            color: Colors.black.withValues(alpha: 0.25),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      height: 3,
      color: AppColors.barraTeal,
    );
  }

  Widget _settingRow(
    String label,
    String action, {
    bool isLast = false,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.barraTeal,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.barraTeal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  action,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!isLast)
          Container(
            height: 1,
            color: AppColors.barraTeal.withValues(alpha: 0.3),
          ),
      ],
    );
  }
}