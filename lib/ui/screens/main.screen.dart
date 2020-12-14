import 'dart:developer';

import 'package:demo_recorder/ui/screens/api_demo.screen.dart';
import 'package:demo_recorder/ui/screens/recordings.screen.dart';
import 'package:demo_recorder/ui/widgets/navigation_bar.widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int index = 0;

  void _changePage(pageIndex) {
    if (index == 0) {
      setState(() {
        index = 1;
      });
    } else {
      setState(() {
        index = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: IndexedStack(
        index: index,
        children: [
          RecordingsScreen(),
          APIDemoScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
