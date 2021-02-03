import 'file:///C:/Work/demo_recorder/lib/services/recording_files.service.dart';
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
                index: controller.index,
                children: getScreens(),
              ),
              bottomNavigationBar: NavigationBar(),
            );
          },
        ),
    );
  }

  List<Widget> getScreens() {
    final list = List<Widget>();
    navigationConfigItems.forEach((configItem) {
      Widget widget = configItem.screenBuilder();
      list.add(widget);
    });

    return list;
  }
}
