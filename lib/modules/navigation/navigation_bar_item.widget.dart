import 'package:demo_recorder/modules/home/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation.config.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key key,
    @required this.config,
  }) : super(key: key);

  final NavigationItemConfig config;

  void _setScreen(HomeController controller) {
    controller.setIndex(config.id);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return InkWell(
      onTap: () => _setScreen(controller),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            config.iconData,
            size: 24.0,
          ),
          Text('${config.title}'),
        ],
      ),
    );
  }
}
