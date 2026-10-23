import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_provider.dart';

class BottomNavigationCustom extends StatelessWidget {
  const BottomNavigationCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, _) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.25),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context,
                icon: Icons.home,
                index: 0,
                currentIndex: chatProvider.currentTab,
              ),
              _buildNavItem(
                context,
                icon: Icons.location_on,
                index: 1,
                currentIndex: chatProvider.currentTab,
              ),
              _buildNavItem(
                context,
                icon: Icons.settings,
                index: 2,
                currentIndex: chatProvider.currentTab,
              ),
              _buildNavItem(
                context,
                icon: Icons.person,
                index: 3,
                currentIndex: chatProvider.currentTab,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required int index,
    required int currentIndex,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.read<ChatProvider>().setCurrentTab(index);
        },
        child: SizedBox(
          width: 110,
          height: 63,
          child: Center(
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
