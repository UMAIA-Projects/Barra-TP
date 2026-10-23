import 'package:flutter/material.dart';
import 'package:desktop/constants/base_screen.dart';
import 'package:desktop/constants/responsive_utils.dart';
import 'package:desktop/areaprivada/areaprivada_1/models/user_model.dart';
import 'package:desktop/areaprivada/areaprivada_1/models/friend_model.dart';
import 'package:desktop/areaprivada/areaprivada_1/widgets/friends_sidebar.dart';
import 'package:desktop/areaprivada/areaprivada_1/widgets/account_info.dart';
import 'package:desktop/areaprivada/areaprivada_1/widgets/sidebar_navigation_ap.dart';

class AreaprivadaScreen extends StatefulWidget {
  const AreaprivadaScreen({super.key});

  @override
  State<AreaprivadaScreen> createState() => _AreaprivadaScreenState();
}

class _AreaprivadaScreenState extends State<AreaprivadaScreen> {
  late List<Friend> friends;

  @override
  void initState() {
    super.initState();
    _initializeFriends();
  }

  void _initializeFriends() {
    friends = [
      Friend(id: 1, name: 'António Silva'),
      Friend(id: 2, name: 'Maria Almeida'),
      Friend(id: 3, name: 'Jesus Cruz'),
      Friend(id: 4, name: 'Paula Tejando'),
    ];
  }

  void _removeFriend(int friendId) {
    setState(() {
      friends.removeWhere((f) => f.id == friendId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final user = User.dummy();

    return BaseScreen(
      activePage: 'Área Privada',
      showSearchBar: false, // Área privada não tem search bar
      customSidebar: const SidebarNavigationAP(activePage: 'Área Privada'),
      child: Stack(
        children: [
          // Conteúdo principal
          Padding(
            padding: EdgeInsets.only(
              left: responsive.responsive(desktop: 32),
              right: responsive.responsive(desktop: 400),
              top: 0,
              bottom: responsive.scaleHeight(30),
            ),
            child: AccountInfoWidget(user: user),
          ),
          // Friends Sidebar à direita
          Positioned(
              top: responsive.scaleHeight(180),
              right: 0,
              bottom: responsive.scaleHeight(30),
              child: FriendsSidebar(
                friends: friends,
                onRemoveFriend: _removeFriend,
              ),
            ),
        ],
      ),
    );
  }
}