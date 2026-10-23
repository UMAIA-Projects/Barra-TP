import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/typography.dart';
import '../widgets/friends_list_popup.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  void _showAddFriendDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Add friend feature coming soon')),
    );
  }

  void _showFriendMenu(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Friend menu options coming soon')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: isMobile
          ? AppBar(
              title: const Text('Friends'),
              backgroundColor: AppColors.primary,
              elevation: 0,
            )
          : null,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!isMobile) ...[
                  Text(
                    'Friends',
                    style: AppTypography.headerLarge.copyWith(
                      color: AppColors.textDark,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Manage your connections',
                    style: AppTypography.smallText.copyWith(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
                // Friends popup/list
                FriendsListPopup(
                  onAddFriendPressed: () =>
                      _showAddFriendDialog(context),
                  onFriendMenuPressed: () => _showFriendMenu(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
