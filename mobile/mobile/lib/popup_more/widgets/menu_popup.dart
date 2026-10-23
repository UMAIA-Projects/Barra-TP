import 'package:flutter/material.dart';
import 'menu_item.dart';
import 'menu_icons.dart';

class MenuPopup extends StatefulWidget {
  const MenuPopup({Key? key}) : super(key: key);

  @override
  State<MenuPopup> createState() => _MenuPopupState();
}

class _MenuPopupState extends State<MenuPopup> {
  final GlobalKey<PopupMenuButtonState<String>> menuKey =
      GlobalKey<PopupMenuButtonState<String>>();

  static const Color menuTeelColor = Color(0xFF365F67);

  final List<Map<String, dynamic>> menuItems = [
    {
      'label': 'Aluguer',
      'icon': Icons.directions_car,
    },
    {
      'label': 'AI Gertrudes',
      'customIcon': true,
      'iconText': 'AI',
    },
    {
      'label': 'Mapas Offline',
      'icon': Icons.wifi_off,
    },
    {
      'label': 'Partilhe',
      'icon': Icons.share,
    },
    {
      'label': 'Avalie-nos',
      'icon': Icons.star,
    },
    {
      'label': 'Privacidade',
      'icon': Icons.security,
    },
    {
      'label': 'Saber Mais',
      'icon': Icons.info,
    },
    {
      'label': 'Contacte-nos',
      'icon': Icons.phone,
    },
    {
      'label': 'Definições',
      'icon': Icons.settings,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      key: menuKey,
      onSelected: (value) {
        // Handle menu item selection
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$value selecionado')),
        );
      },
      position: PopupMenuPosition.under,
      color: menuTeelColor,
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      constraints: const BoxConstraints(
        minWidth: 165,
        maxWidth: 165,
      ),
      itemBuilder: (BuildContext context) {
        return menuItems.asMap().entries.map((entry) {
          final item = entry.value;
          final index = entry.key;

          return PopupMenuItem<String>(
            value: item['label'],
            height: 28,
            padding: EdgeInsets.zero,
            child: Container(
              width: 151,
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: item['customIcon'] == true
                        ? Center(
                            child: Text(
                              item['iconText'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                height: 1.0,
                              ),
                            ),
                          )
                        : Icon(
                            item['icon'] as IconData,
                            size: 22,
                            color: Colors.white,
                          ),
                  ),
                  const SizedBox(width: 3),
                  Expanded(
                    child: Text(
                      item['label'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'NunitoSans',
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        height: 1.45,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: menuTeelColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Text(
          'Abrir Menu',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'NunitoSans',
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
