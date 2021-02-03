import 'package:demo_recorder/entities/recording.entity.dart';
import 'package:demo_recorder/util/file_system.util.dart';
import 'package:flutter/material.dart';

class RecordingFilesService extends ChangeNotifier {
  final List<Recording> _recordings = [];
  List<Recording> get recordings => _recordings;

  RecordingFilesService() {
    this._initRecordings();
  }

  void _initRecordings() async {
    final List<String> paths = await FileSystemUtil.getFilePaths();
    _recordings.clear();
    paths.forEach((e) {
      _addSortedRecording(Recording(e));
    });
    notifyListeners();
  }

  void addRecording(String path) {
    _addSortedRecording(Recording(path));
    notifyListeners();
  }

  void _addSortedRecording(Recording recording) {
    _recordings.insert(0, recording);
  }

}
