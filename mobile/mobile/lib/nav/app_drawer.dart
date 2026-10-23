import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // header
            Container(
              width: double.infinity,
              //padding: const EdgeInsets.all(16),
              //constraints: const BoxConstraints(minHeight: 112),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(
                        alpha: Theme.of(context).brightness == Brightness.dark
                            ? 0.6
                            : 0.45),
                    //color: Colors.black.withValues(alpha: 0.45),
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 44),
                  Text(
                    ' ',
                    style: AppTypography.headerText.copyWith(
                      color: AppColors.headerText(context),
                    ),
                  ),
                  //const SizedBox(height: 8),
                  /*
                  Text(
                    'Menu',
                    style: textTheme.bodyMedium!.copyWith(
                      color: AppColors.headerText(context).withValues(alpha: 0.8),
                    ),
                  ),
                  */
                ],
              ),
            ),

            // opçóes
            Expanded(
              child: ListView(
                children: [
                  _DrawerItem(
                    label: 'Home',
                    asset: 'assets/icons/home.svg',
                    routeName: '/home',
                    currentRoute: currentRoute,
                  ),
                  _DrawerItem(
                    label: 'Mapa',
                    asset: 'assets/icons/loc.svg',
                    routeName: '/locations',
                    currentRoute: currentRoute,
                  ),
                  _DrawerItem(
                    label: 'Pedidos',
                    asset: 'assets/icons/lines.svg',
                    routeName: '/orders',
                    currentRoute: currentRoute,
                  ),
                  _DrawerItem(
                    label: 'Perfil',
                    asset: 'assets/icons/profile.svg',
                    routeName: '/profile',
                    currentRoute: currentRoute,
                  ),
                  const Divider(),
                  _DrawerItem(
                    label: 'Terminar sessão',
                    asset: 'assets/icons/profile.svg',
                    routeName: '/login',
                    currentRoute: currentRoute,
                    logout: true,
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

class _DrawerItem extends StatelessWidget {
  final String label;
  final String asset;
  final String routeName;
  final String? currentRoute;
  final bool logout;

  const _DrawerItem({
    required this.label,
    required this.asset,
    required this.routeName,
    required this.currentRoute,
    this.logout = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isSelected = currentRoute == routeName;

    final Color iconColor = isSelected
        ? colorScheme.primary
        : colorScheme.onSurface.withValues(alpha: 0.7);

    final TextStyle textStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: isSelected
              ? colorScheme.primary
              : colorScheme.onSurface.withValues(alpha: 0.8),
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
        );

    return InkWell(
      onTap: () {
        Navigator.pop(context); // fecha o drawer

        if (logout) {
          // limpa stack e vai para login
          Navigator.pushNamedAndRemoveUntil(
            context,
            routeName,
            (route) => false,
          );
        } else if (!isSelected) {
          // troca de página sem empilhar infinitamente
          Navigator.pushReplacementNamed(context, routeName);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ListTile(
          leading: SvgPicture.asset(
            asset,
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
          title: Text(label, style: textStyle),
          dense: true,
        ),
      ),
    );
  }
}
