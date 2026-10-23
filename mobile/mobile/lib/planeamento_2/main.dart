import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app/theme/app_theme.dart';
import 'app/navigation/app_router.dart';
import 'app/providers/app_provider.dart';

void main() {
  runApp(const BarraTpApp());
}

class BarraTpApp extends StatelessWidget {
  const BarraTpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: MaterialApp.router(
        title: 'BARRA TP',
        theme: AppTheme.lightTheme,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
