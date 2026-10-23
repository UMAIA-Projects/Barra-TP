import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/account_settings_screen.dart';
import 'providers/account_provider.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const BarraTPApp());
}

class BarraTPApp extends StatelessWidget {
  const BarraTPApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AccountProvider()),
      ],
      child: MaterialApp(
        title: 'BARRA TP',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const AccountSettingsScreen(),
      ),
    );
  }
}
