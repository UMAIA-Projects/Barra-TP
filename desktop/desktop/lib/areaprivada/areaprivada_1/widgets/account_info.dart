import 'package:flutter/material.dart';
import 'package:desktop/constants/colors.dart';
import 'package:desktop/constants/themes.dart';
import 'package:desktop/areaprivada/areaprivada_1/models/user_model.dart';
import 'package:desktop/constants/routes.dart';

class AccountInfoWidget extends StatelessWidget {
  final User user;

  const AccountInfoWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 870,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          color: AppColors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.transparent,
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.all(48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Account Information Section
                _SectionHeader(title: 'Informações da conta'),
                const SizedBox(height: 24),
                _InfoField(
                  label: 'Nome completo:',
                  value: user.fullName,
                  onEdit: () {},
                ),
                _Divider(),
                _InfoField(
                  label: 'Nome exibido:',
                  value: user.displayName,
                  onEdit: () {},
                ),
                _Divider(),
                _InfoField(
                  label: 'Email:',
                  value: user.primaryEmail,
                  onEdit: () {},
                ),
                _Divider(),
                _InfoField(
                  label: 'Email secundário:',
                  value: user.secondaryEmail,
                  onEdit: () {},
                ),
                _Divider(),
                _InfoField(
                  label: 'Telefone:',
                  value: user.phone,
                  onEdit: () {},
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 220,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text('Alterar Foto de Perfil', style: AppTheme.buttonStyle),
                  ),
                ),
                const SizedBox(height: 32),
                _LargeDivider(),
                const SizedBox(height: 32),
                // Privacy Section
                _SectionHeader(title: 'Privacidade'),
                const SizedBox(height: 24),
                _PrivacySetting(
                  label: 'Notificação de Ofertas por Email',
                  action: 'Desativar',
                  onAction: () {},
                ),
                _Divider(),
                _PrivacySetting(
                  label: 'Partilhar a minha localização',
                  action: 'Editar',
                  onAction: () {},
                ),
                _Divider(),
                _PrivacySetting(
                  label: 'Pedidos de amizade',
                  action: 'Desativar',
                  onAction: () {},
                ),
                _Divider(),
                _PrivacySetting(
                  label: 'Partilha de dados com Terceiros',
                  action: 'Desativar',
                  onAction: () {},
                ),
                _Divider(),
                _PrivacySetting(
                  label: 'Anúncios Personalizados',
                  action: 'Desativar',
                  onAction: () {},
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 220,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Termos e Condições', style: AppTheme.buttonStyle),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Account Management Section
                _SectionHeader(title: 'Gerenciamento da conta'),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ActionButton(
                      label: 'Alterar Palavra-Passe',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.recuperar);
                      },
                    ),
                    _ActionButton(
                      label: 'Terminar Sessão',
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.login);
                      },
                    ),
                    _ActionButton(
                      label: 'Desativar Conta',
                      onPressed: () {},
                    ),
                    _ActionButton(
                      label: 'Excluir conta',
                      isDangerous: true,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTheme.titleStyle,
    );
  }
}

class _InfoField extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onEdit;

  const _InfoField({
    required this.label,
    required this.value,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: label,
                    style: const TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' $value',
                    style: const TextStyle(
                      color: AppTheme.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 140,
            height: 40,
            child: ElevatedButton(
              onPressed: onEdit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Editar', style: AppTheme.buttonStyle),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrivacySetting extends StatelessWidget {
  final String label;
  final String action;
  final VoidCallback onAction;

  const _PrivacySetting({
    required this.label,
    required this.action,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: AppTheme.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 140,
            height: 40,
            child: ElevatedButton(
              onPressed: onAction,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(action, style: AppTheme.buttonStyle),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final bool isDangerous;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.label,
    this.isDangerous = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDangerous ? AppTheme.destructiveColor : AppTheme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(label, style: AppTheme.buttonStyle),
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: AppTheme.primaryColor.withValues(alpha: 0.3),
      margin: const EdgeInsets.symmetric(vertical: 8),
    );
  }
}

class _LargeDivider extends StatelessWidget {
  const _LargeDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      color: AppTheme.primaryColor,
    );
  }
}