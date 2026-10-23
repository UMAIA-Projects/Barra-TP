import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../common/navigation_helper.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const AppBottomNav({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF365F67),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            offset: const Offset(0, -4),
            blurRadius: 4,
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xFF365F67),
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) {
          onTap?.call(index);
          NavigationHelper.navigateToPage(context, index);
        },
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.location_on, 1),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: _buildRouteIcon(),
            label: 'Routes',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.person, 3),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    final isSelected = currentIndex == index;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: isSelected && index == 1
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ]
            : [],
      ),
      child: Icon(
        icon,
        size: index == 0 ? 50 : 40,
        color: Colors.white,
      ),
    );
  }

  Widget _buildRouteIcon() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: SvgPicture.string(
        '''<svg width="30" height="30" viewBox="0 0 110 63" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M49.8613 47C48.0463 47 46.5046 46.3608 45.2362 45.0825C43.9676 43.8042 43.3333 42.2674 43.3333 40.4721V26.2362C42.3611 25.8751 41.5625 25.2917 40.9375 24.4858C40.3125 23.68 40 22.7619 40 21.7317C40 20.4106 40.4629 19.2917 41.3888 18.375C42.3149 17.4583 43.4307 17 44.7362 17C46.0418 17 47.1529 17.4596 48.0696 18.3788C48.9863 19.2979 49.4446 20.4142 49.4446 21.7275C49.4446 22.7517 49.1321 23.6689 48.5071 24.4792C47.8821 25.2894 47.0835 25.8751 46.1113 26.2362V40.4721C46.1113 41.5035 46.4746 42.3864 47.2012 43.1208C47.9282 43.855 48.8194 44.2221 49.875 44.2221C50.9306 44.2221 51.8171 43.855 52.5346 43.1208C53.2524 42.3864 53.6113 41.5035 53.6113 40.4721V23.5279C53.6113 21.7129 54.2454 20.1712 55.5138 18.9029C56.7824 17.6343 58.324 17 60.1388 17C61.9538 17 63.4954 17.6343 64.7638 18.9029C66.0324 20.1712 66.6667 21.7129 66.6667 23.5279V37.7638C67.6389 38.1249 68.4375 38.7093 69.0625 39.5171C69.6875 40.3249 70 41.2451 70 42.2779C70 43.574 69.5408 44.6851 68.6225 45.6112C67.7044 46.5371 66.5896 47 65.2779 47C63.9815 47 62.8704 46.5371 61.9446 45.6112C61.0185 44.6851 60.5554 43.574 60.5554 42.2779C60.5554 41.2446 60.8679 40.3172 61.4929 39.4958C62.1179 38.6744 62.9165 38.0971 63.8888 37.7638V23.5279C63.8888 22.4815 63.5254 21.5949 62.7987 20.8679C62.0718 20.1413 61.1851 19.7779 60.1388 19.7779C59.0926 19.7779 58.2061 20.1413 57.4792 20.8679C56.7522 21.5949 56.3888 22.4815 56.3888 23.5279V40.4721C56.3888 42.2674 55.7546 43.8042 54.4863 45.0825C53.2176 46.3608 51.676 47 49.8613 47Z" fill="white"/>
</svg>''',
        width: 30,
        height: 30,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
