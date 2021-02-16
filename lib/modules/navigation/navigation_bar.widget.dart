import 'package:flutter/material.dart';

import 'navigation.config.dart';
import 'navigation_bar_item.widget.dart';

class NavigationBar extends StatelessWidget {
  static const double HEIGHT = 64;

  @override
  Widget build(BuildContext context) {
    final navigationItemsList = navigationConfigItems
        .map((item) => Expanded(
              child: NavigationBarItem(config: item),
            ))
        .toList();
    return BottomAppBar(
      child: Container(
        height: HEIGHT,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: navigationItemsList,
        ),
      ),
    );
  }
}
