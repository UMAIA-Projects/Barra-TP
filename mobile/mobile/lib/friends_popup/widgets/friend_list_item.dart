import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/typography.dart';
import '../models/friend.dart';
import 'user_avatar.dart';

class FriendListItem extends StatefulWidget {
  final Friend friend;
  final VoidCallback? onMorePressed;

  const FriendListItem({
    Key? key,
    required this.friend,
    this.onMorePressed,
  }) : super(key: key);

  @override
  State<FriendListItem> createState() => _FriendListItemState();
}

class _FriendListItemState extends State<FriendListItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        color: _isHovered ? Colors.transparent : Colors.transparent,
        child: Row(
          children: [
            // Avatar
            const UserAvatar(size: 42),
            const SizedBox(width: 12),
            // Friend name
            Expanded(
              child: Text(
                widget.friend.name,
                style: AppTypography.friendName,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // More button
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.onMorePressed,
                borderRadius: BorderRadius.circular(4),
                hoverColor: Colors.white.withValues(alpha: 0.1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
