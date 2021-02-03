import 'package:flutter/material.dart';

import 'navigation.config.dart';
import 'navigation_bar_item.widget.dart';

class NavigationBar extends StatelessWidget {
  static const double HEIGHT = 64;

  final navigationItemsList = navigationConfigItems
      .map((item) => NavigationBarItem(config: item))
      .toList();

  @override
  Widget build(BuildContext context) {
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
