import 'package:demo_recorder/modules/recording/recording.screen.dart';
import 'package:demo_recorder/modules/recordings_list/recordings_list.screen.dart';
import 'package:flutter/material.dart';

enum NavigationItemId {
  recordings_list,
  recording,
}

class NavigationItemConfig {
  final NavigationItemId id;
  final String iconName;
  final String title;
  final Function screenBuilder;

  NavigationItemConfig({
    @required this.id,
    @required this.iconName,
    @required this.title,
    @required this.screenBuilder,
  });
}

final navigationConfigItems = <NavigationItemConfig>[
  NavigationItemConfig(
    id: NavigationItemId.recordings_list,
    iconName: 'list',
    title: 'Recordings list',
    screenBuilder: () => RecordingsListScreen(),
  ),
  NavigationItemConfig(
    id: NavigationItemId.recording,
    iconName: 'record',
    title: 'Recording',
    screenBuilder: () => RecordingsScreen(),
  ),
];
