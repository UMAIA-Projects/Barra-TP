import 'package:flutter/material.dart';
import 'package:desktop/constants/themes.dart';
import 'package:desktop/areaprivada/areaprivada_1/models/friend_model.dart';

class FriendsSidebar extends StatelessWidget {
  final List<Friend> friends;
  final Function(int) onRemoveFriend;

  const FriendsSidebar({
    Key? key,
    required this.friends,
    required this.onRemoveFriend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398, // Mesma largura do UserInfoCard para alinhamento
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Text(
                'Amigos',
                textAlign: TextAlign.center,
                style: AppTheme.titleStyle,
              ),
              const SizedBox(height: 24),
              Container(
                height: 4,
                color: AppTheme.primaryColor,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.separated(
                  itemCount: friends.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final friend = friends[index];
                    return _FriendItem(
                      friend: friend,
                      onRemove: () => onRemoveFriend(friend.id),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Ver Todos os Amigos',
                    style: AppTheme.buttonStyle,
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

class _FriendItem extends StatelessWidget {
  final Friend friend;
  final VoidCallback onRemove;

  const _FriendItem({
    required this.friend,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
              ),
            ],
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            friend.name,
            style: const TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, color: AppTheme.destructiveColor),
          onPressed: onRemove,
          constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
          padding: EdgeInsets.zero,
        ),
      ],
    );
  }
}
