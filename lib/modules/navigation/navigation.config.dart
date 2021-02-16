import 'package:demo_recorder/modules/recording/recording.screen.dart';
import 'package:demo_recorder/modules/recordings_list/recordings_list.screen.dart';
import 'package:flutter/material.dart';

enum NavigationItemId {
  recording,
  recordingsList,
}

class NavigationItemConfig {
  final NavigationItemId id;
  final IconData iconData;
  final String title;
  final Widget Function() screenBuilder;

  NavigationItemConfig({
    @required this.id,
    @required this.iconData,
    @required this.title,
    @required this.screenBuilder,
  });
}

final navigationConfigItems = <NavigationItemConfig>[
  NavigationItemConfig(
    id: NavigationItemId.recording,
    iconData: Icons.fiber_manual_record,
    title: 'Recording',
    screenBuilder: () => RecordingsScreen(),
  ),
  NavigationItemConfig(
    id: NavigationItemId.recordingsList,
    iconData: Icons.list,
    title: 'Recordings list',
    screenBuilder: () => RecordingsListScreen(),
  ),
];
