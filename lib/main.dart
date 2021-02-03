import 'package:demo_recorder/services/recording_files.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/home/home.screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.

  final List<ListenableProvider> providers = [
    ListenableProvider<RecordingFilesService>(create: (_) => RecordingFilesService()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Recorder',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[900],
        accentColor: Colors.amber[700],
        buttonColor: Colors.red[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: providers,
        child: HomeScreen(),
      ),
    );
  }
}
