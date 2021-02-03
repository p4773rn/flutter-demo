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
        accentColor: Colors.red[700],
        buttonColor: Colors.red[800],
        sliderTheme: SliderThemeData(
          activeTrackColor: Colors.red[600],
          inactiveTrackColor: Colors.white,
          trackShape: RectangularSliderTrackShape(),
          trackHeight: 2.0,
          thumbColor: Colors.red[800],
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
          overlayColor: Colors.red.withAlpha(32),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: providers,
        child: HomeScreen(),
      ),
    );
  }
}
