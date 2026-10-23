import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/typography.dart';
import '../models/friend.dart';
import 'friend_list_item.dart';

class FriendsListPopup extends StatefulWidget {
  final VoidCallback? onAddFriendPressed;
  final VoidCallback? onFriendMenuPressed;
  final bool isDialog;

  const FriendsListPopup({
    Key? key,
    this.onAddFriendPressed,
    this.onFriendMenuPressed,
    this.isDialog = true,
  }) : super(key: key);

  @override
  State<FriendsListPopup> createState() => _FriendsListPopupState();
}

class _FriendsListPopupState extends State<FriendsListPopup> {
  final List<Friend> friends = [
    Friend(id: 1, name: 'António Silva'),
    Friend(id: 2, name: 'Maria Almeida'),
    Friend(id: 3, name: 'Jesus Cruz'),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final maxWidth = isMobile ? double.infinity : 320.0;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 4,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Friends list
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: friends.length,
                separatorBuilder: (context, index) => Container(
                  height: 1,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
                itemBuilder: (context, index) {
                  return FriendListItem(
                    friend: friends[index],
                    onMorePressed: widget.onFriendMenuPressed,
                  );
                },
              ),
              // Divider before button
              Container(
                height: 1,
                color: Colors.white.withValues(alpha: 0.1),
              ),
              // Add friend button
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onAddFriendPressed,
                  hoverColor: Colors.white.withValues(alpha: 0.1),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Text(
                      'Adicionar amigo',
                      style: AppTypography.buttonText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
