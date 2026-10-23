import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/train_line.dart';
import '../providers/train_provider.dart';
import '../../common/header_app.dart';
import '../../common/footer.dart';
import '../../common/navigation_bar.dart';
import '../../common/navigation_helper.dart';
import '../../common/linhas_navigation_helper.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredLines = ref.watch(filteredTrainLinesProvider);
    final selectedTab = ref.watch(selectedTabProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Column(
        children: [
          // Common Header
          const HeaderApp(),
          // Search Bar (alertas style)
          Container(
            color: const Color(0xFFE6E6E6),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
              },
              decoration: const InputDecoration(
                hintText: 'Pesquisar linha...',
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Navigation Tabs (alertas style)
          Container(
            color: const Color(0xFF365F67),
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {
                      LinhasNavigationHelper.navigateToTab(context, 'alertas');
                    },
                    child: Container(
                      width: 48,
                      alignment: Alignment.center,
                      child: const Icon(Icons.notifications, color: Colors.white),
                    ),
                  );
                }
                final tabs = ['Favoritos', 'Todos', 'Autocarro', 'Comboio', 'Metro'];
                final tabName = tabs[index - 1];
                final isActive = selectedTab == tabName.toLowerCase();
                return GestureDetector(
                  onTap: () {
                    if (tabName.toLowerCase() == 'comboio') {
                      ref.read(selectedTabProvider.notifier).state = 'comboio';
                    } else {
                      LinhasNavigationHelper.navigateToTab(context, tabName.toLowerCase());
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Center(
                      child: Text(
                        tabName,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Content Area
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Section Header
                  Container(
                    color: const Color(0xFFD9D9D9),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.train,
                          color: Color(0xFF365F67),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'CP - Comboios Portugal',
                          style: TextStyle(
                            color: const Color(0xFF365F67),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Legend
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'AP: Alfa Pendular  |  IC: Intercidades  |  IR: InterRegional  |  R: Regional  |  Sem sigla: Urbano/Suburbano',
                      style: TextStyle(
                        color: const Color(0xFF365F67),
                        fontSize: 7,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Train Lines List
                  ...filteredLines.map((line) => _buildLineItem(context, line)),
                  const SizedBox(height: 80), // Space for bottom nav
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomBar(
        currentIndex: 2,
      ),
    );
  }

  Widget _buildNavTab(
    String label,
    String value,
    String selectedTab,
    WidgetRef ref,
  ) {
    final isSelected = selectedTab == value;
    return GestureDetector(
      onTap: () {
        ref.read(selectedTabProvider.notifier).state = value;
      },
      child: Container(
        color: isSelected ? const Color(0xFF407079) : const Color(0xFF365F67),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLineItem(BuildContext context, TrainLine line) {
    final color = line.color;
    final isWhiteBackground = color.toUpperCase() == '#FFFFFF';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          // Line Badge
          Container(
            width: 60,
            height: 20,
            decoration: BoxDecoration(
              color: isWhiteBackground
                  ? Colors.white
                  : Color(
                      int.parse('0xFF${color.replaceFirst('#', '')}'),
                    ),
              borderRadius: BorderRadius.circular(20),
              border: isWhiteBackground
                  ? Border.all(
                      color: const Color(0xFF365F67),
                      width: 1,
                    )
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 6,
                  child: Icon(
                    Icons.train,
                    size: 16,
                    color: isWhiteBackground
                        ? const Color(0xFF365F67)
                        : Colors.white,
                  ),
                ),
                Positioned(
                  right: 6,
                  child: Text(
                    line.type.label,
                    style: TextStyle(
                      color: isWhiteBackground
                          ? const Color(0xFF365F67)
                          : Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Line Name
          Expanded(
            child: Text(
              line.name,
              style: const TextStyle(
                color: Color(0xFF365F67),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          // Ver Paragens Button
          GestureDetector(
            onTap: () {
              LinhasNavigationHelper.navigateToCpItinerary(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                border: Border.all(
                  color: const Color(0xFF365F67),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    offset: const Offset(2, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.map,
                    size: 12,
                    color: const Color(0xFF365F67),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Ver Paragens',
                    style: TextStyle(
                      color: const Color(0xFF365F67),
                      fontSize: 7,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavIcon(BuildContext context, IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () {
        NavigationHelper.navigateToPage(context, index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 28),
        ],
      ),
    );
  }
}
