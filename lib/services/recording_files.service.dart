import 'package:demo_recorder/entities/recording.entity.dart';
import 'package:demo_recorder/util/file_system.util.dart';
import 'package:flutter/material.dart';

/// Service to obtain previously created recordings and add new ones
/// Notifies listeners when new recording is created
class RecordingFilesService extends ChangeNotifier {
  final List<Recording> _recordings = [];
  List<Recording> get recordings => _recordings;

  RecordingFilesService() {
    this._initRecordings();
  }

  /// Asynchronously obtain previously created recordings
  /// Notifies listeners when its done
  void _initRecordings() async {
    final List<String> paths = await FileSystemUtil.getRecordingPaths();
    _recordings.clear();
    paths.forEach((e) {
      _addSortedRecording(Recording(e));
    });
    notifyListeners();
  }

  /// Add new recording so that listeners are notified
  void addRecording(String path) {
    _addSortedRecording(Recording(path));
    notifyListeners();
  }

  void _addSortedRecording(Recording recording) {
    _recordings.insert(0, recording);
  }

}
