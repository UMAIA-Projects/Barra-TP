import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showMenu;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onLocationPressed;

  const CustomAppBar({
    Key? key,
    this.showMenu = true,
    this.onMenuPressed,
    this.onLocationPressed,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.brandPrimary,
      elevation: 4,
      automaticallyImplyLeading: false,
      title: const Text('BARRA TP'),
      actions: [
        IconButton(
          icon: const Icon(Icons.location_on, color: Colors.white, size: 28),
          onPressed: onLocationPressed,
        ),
        const SizedBox(width: 8),
      ],
      leading: showMenu
          ? IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: onMenuPressed,
            )
          : null,
    );
  }
}
