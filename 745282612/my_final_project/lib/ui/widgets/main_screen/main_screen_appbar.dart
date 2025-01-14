import 'package:flutter/material.dart';

import 'package:my_final_project/utils/theme/theme_inherited.dart';

class MainScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  final int index;

  const MainScreenAppBar({
    super.key,
    required this.index,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  State<MainScreenAppBar> createState() => _MainScreenAppBarState();
}

class _MainScreenAppBarState extends State<MainScreenAppBar> {
  final _listTitle = [
    'Home',
    'Daily',
    'Timeline',
    'Explore',
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_listTitle[widget.index]),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.invert_colors),
          onPressed: () {
            setState(
              () {
                CustomThemeInherited.of(context).changeTheme();
              },
            );
          },
        ),
      ],
    );
  }
}
