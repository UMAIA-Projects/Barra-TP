import 'package:flutter/material.dart';
import '../widgets/friends_list_popup.dart';

Future<void> showFriendsDialog(
  BuildContext context, {
  VoidCallback? onAddFriendPressed,
  VoidCallback? onFriendMenuPressed,
}) {
  final isMobile = MediaQuery.of(context).size.width < 600;

  return showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
      child: FriendsListPopup(
        onAddFriendPressed: onAddFriendPressed ??
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Add friend feature')),
              );
            },
        onFriendMenuPressed: onFriendMenuPressed ??
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Friend menu options')),
              );
            },
        isDialog: true,
      ),
    ),
  );
}
