import 'package:demo_recorder/util/file_system.util.dart';
import 'package:demo_recorder/util/permissions.util.dart';
import 'package:flutter/cupertino.dart';
import 'package:record_mp3/record_mp3.dart';


/// Service to start and stop audio recording
class RecorderService {
  RecordMp3 _instance;

  RecorderService() {
    _instance = RecordMp3.instance;
  }

  /// Start the audio recording
  /// Should provide [onErrorCallback] that is executed in case of recording failure
  Future<String> start(String recordFilePath, VoidCallback onErrorCallback) async {
    bool hasPermission = await PermissionsUtil.checkRecordingPermission();
    if (hasPermission) {
      final recordingFilePath = await FileSystemUtil.getNewRecordingPath(recordFilePath);
      _instance.start(recordingFilePath, (type) {
        onErrorCallback();
      });
      return recordingFilePath;
    }

    return null;
  }

  /// Stop the audio recording
  void stop() {
    _instance.stop();
  }
}
