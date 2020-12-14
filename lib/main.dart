import 'package:flutter/material.dart';

import 'ui/screens/main.screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Recorder',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        accentColor: Colors.amber[700],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(title: 'Demo Recorder'),
    );
  }
}

