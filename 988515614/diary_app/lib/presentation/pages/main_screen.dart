import 'home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MainScreen extends HookWidget {
  const MainScreen({super.key});
  static const _tabNames = ['Home', 'Daily', 'Timeline', 'Explore'];
  final List<Widget> _pages = const [
    HomePage(), // Home
    Text('2nd'), // Daily
    Text('3rd'), // Timeline
    Text('4th'), // Explore
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final currentTab = useState(_tabNames[currentIndex.value]);

    return Scaffold(
      appBar: _buildAppBar(currentTab),
      body: _buildBody(currentIndex),
      bottomNavigationBar: _buildBottomNavBar(
        currentIndex,
        currentTab,
      ),
    );
  }

  Widget _buildBottomNavBar(
      ValueNotifier<int> currentIndex, ValueNotifier<String> currentTab) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex.value,
      selectedItemColor: Colors.teal.shade800,
      unselectedItemColor: Colors.grey.shade700,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      onTap: (index) {
        currentIndex.value = index;
        currentTab.value = _tabNames[index];
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(
            Icons.book,
          ),
        ),
        BottomNavigationBarItem(
          label: 'Daily',
          icon: Icon(Icons.access_time_filled_sharp),
        ),
        BottomNavigationBarItem(
          label: 'Timeline',
          icon: Icon(Icons.map),
        ),
        BottomNavigationBarItem(
          label: 'Explore',
          icon: Icon(Icons.architecture_outlined),
        ),
      ],
    );
  }

  Widget _buildBody(ValueNotifier<int> currentIndex) {
    return _pages.elementAt(currentIndex.value);
  }

  PreferredSizeWidget _buildAppBar(ValueNotifier<String> currentTab) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        splashRadius: 20,
        icon: const Icon(CupertinoIcons.line_horizontal_3),
        onPressed: () {},
      ),
      title: Text(
        currentTab.value,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: [
        IconButton(
          splashRadius: 20,
          icon: const Icon(CupertinoIcons.drop_fill),
          onPressed: () {},
        ),
      ],
    );
  }
}
