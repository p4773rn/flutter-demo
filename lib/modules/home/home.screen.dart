import 'package:demo_recorder/modules/navigation/navigation.config.dart';
import 'package:demo_recorder/modules/navigation/navigation_bar.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home.controller.dart';

class HomeScreen extends StatelessWidget {
  final String title = 'MP3 Recorder';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: Consumer<HomeController>(
        builder: (context, controller, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: IndexedStack(
              index: controller.navigationItemIndex.index,
              children: getScreens(),
            ),
            bottomNavigationBar: NavigationBar(),
          );
        },
      ),
    );
  }

  List<Widget> getScreens() {
    return navigationConfigItems.map((configItem) => configItem.screenBuilder()).toList();
  }
}
