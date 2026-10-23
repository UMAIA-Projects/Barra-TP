import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../providers/account_provider.dart';
import '../widgets/account_info_field.dart';
import '../widgets/edit_field_dialog.dart';
import '../../common/header_app.dart';
import '../../common/navigation_bar.dart';
import '../../friends_popup/utils/friends_dialog.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {

  void _showEditDialog(
    BuildContext context,
    String title,
    String currentValue,
    Function(String) onSave,
  ) {
    showDialog(
      context: context,
      builder: (context) => EditFieldDialog(
        title: title,
        initialValue: currentValue,
        onSave: onSave,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final accountProvider = context.watch<AccountProvider>();
    final account = accountProvider.accountInfo;
    final maxWidth = isMobile ? double.infinity : 440.0;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Container(
            width: maxWidth,
            constraints: BoxConstraints(
              maxWidth: maxWidth,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.brandTeal),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4,
                  color: Color.fromARGB(64, 0, 0, 0),
                ),
              ],
              color: AppTheme.backgroundColor,
            ),
            child: Column(
              children: [
                const HeaderApp(),
                // Breadcrumb/Return bar
                Container(
                  height: 48,
                  color: AppTheme.brandSecondary,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 32,
                        height: 22,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color: Color.fromARGB(64, 0, 0, 0),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.person, color: AppTheme.brandPrimary, size: 20),
                      ),
                    ],
                  ),
                ),
                // Subheader
                Container(
                  height: 48,
                  color: AppTheme.brandSecondary,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => accountProvider.setActiveTab(0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.brandPrimary,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Text(
                              'Definições de Conta',
                              style: TextStyle(
                                fontFamily: 'DaysOne',
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            showFriendsDialog(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.brandPrimary,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: const Text(
                              'Amigos',
                              style: TextStyle(
                                fontFamily: 'DaysOne',
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Profile Section
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 24,
                            horizontal: 16,
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 176,
                                height: 176,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppTheme.brandLight,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 8,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.person,
                                    size: 100,
                                    color: AppTheme.brandPrimary,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                account.displayName,
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '@${account.username}',
                                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Account Information Section
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4),
                                child: Text(
                                  'Informações da Conta',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(fontSize: 12),
                                ),
                              ),
                              const Divider(
                                color: AppTheme.brandPrimary,
                                thickness: 1,
                              ),
                              AccountInfoField(
                                label: 'Nome completo:',
                                value: account.fullName,
                                onEdit: () => _showEditDialog(
                                  context,
                                  'Nome Completo',
                                  account.fullName,
                                  (value) {
                                    accountProvider.updateFullName(value);
                                  },
                                ),
                                isMobile: isMobile,
                              ),
                              AccountInfoField(
                                label: 'Nome exibido:',
                                value: account.displayName,
                                onEdit: () => _showEditDialog(
                                  context,
                                  'Nome Exibido',
                                  account.displayName,
                                  (value) {
                                    accountProvider.updateDisplayName(value);
                                  },
                                ),
                                isMobile: isMobile,
                              ),
                              AccountInfoField(
                                label: 'Username:',
                                value: account.username,
                                onEdit: () => _showEditDialog(
                                  context,
                                  'Username',
                                  account.username,
                                  (value) {
                                    accountProvider.updateUsername(value);
                                  },
                                ),
                                isMobile: isMobile,
                              ),
                              AccountInfoField(
                                label: 'Email:',
                                value: account.email,
                                onEdit: () => _showEditDialog(
                                  context,
                                  'Email',
                                  account.email,
                                  (value) {
                                    accountProvider.updateEmail(value);
                                  },
                                ),
                                isMobile: isMobile,
                              ),
                              AccountInfoField(
                                label: 'Email secundário:',
                                value: account.secondaryEmail,
                                onEdit: () => _showEditDialog(
                                  context,
                                  'Email Secundário',
                                  account.secondaryEmail,
                                  (value) {
                                    accountProvider.updateSecondaryEmail(value);
                                  },
                                ),
                                isMobile: isMobile,
                              ),
                              AccountInfoField(
                                label: 'Telefone:',
                                value: account.phone,
                                onEdit: () => _showEditDialog(
                                  context,
                                  'Telefone',
                                  account.phone,
                                  (value) {
                                    accountProvider.updatePhone(value);
                                  },
                                ),
                                isMobile: isMobile,
                              ),
                              // Friendship Code
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Código de Amizade: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                        text: account.friendshipCode,
                                        style: Theme.of(context).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Account Management Section
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4, bottom: 8),
                                child: Text(
                                  'Gerenciamento da conta',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(fontSize: 12),
                                ),
                              ),
                              const Divider(
                                color: AppTheme.brandPrimary,
                                thickness: 1,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 36,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await accountProvider.changePassword('');
                                            if (mounted) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                  content: Text('Password alterado com sucesso'),
                                                ),
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                          ),
                                          child: const Text(
                                            'Alterar Password',
                                            style: TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 36,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await accountProvider.endSession();
                                            if (mounted) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                  content: Text('Sessão encerrada'),
                                                ),
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                          ),
                                          child: const Text(
                                            'Terminar Sessão',
                                            style: TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 36,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await accountProvider.deactivateAccount();
                                            if (mounted) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                  content: Text('Conta desativada'),
                                                ),
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                          ),
                                          child: const Text(
                                            'Desativar Conta',
                                            style: TextStyle(fontSize: 10),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 36,
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            final confirmed = await showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text('Excluir Conta'),
                                                content: const Text(
                                                  'Tem certeza que deseja excluir sua conta? Esta ação é irreversível.',
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(context, false),
                                                    child: const Text('Cancelar'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(context, true),
                                                    child: const Text('Excluir'),
                                                  ),
                                                ],
                                              ),
                                            );
                                            if (confirmed == true && mounted) {
                                              await accountProvider.deleteAccount();
                                              if (mounted) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  const SnackBar(
                                                    content: Text('Conta excluída com sucesso'),
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppTheme.destructive,
                                            padding: const EdgeInsets.symmetric(horizontal: 8),
                                          ),
                                          child: const Text(
                                            'Excluir Conta',
                                            style: TextStyle(fontSize: 10, color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
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