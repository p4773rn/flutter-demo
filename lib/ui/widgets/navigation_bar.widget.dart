import 'package:demo_recorder/config/navigation.config.dart';
import 'package:flutter/material.dart';

import 'navigation_bar__item.widget.dart';

class NavigationBar extends StatelessWidget {
  static const double HEIGHT = 64;


  final navigationItems = [

  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: HEIGHT,
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            NavigationBarItem(id: 'RECORDING', text: 'One'),
            NavigationBarItem(id: 'API_DEMO', text: 'Two'),
            NavigationBarItem(id: 'ANIMATION', text: 'Three'),
          ],
        ),
      ),
    );
  }

}