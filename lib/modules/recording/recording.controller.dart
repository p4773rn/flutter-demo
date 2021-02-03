import 'package:demo_recorder/services/recorder.service.dart';
import 'package:demo_recorder/services/recording_files.service.dart';
import 'package:demo_recorder/util/file_system.util.dart';
import 'package:flutter/material.dart';
import 'package:demo_recorder/util/permissions.util.dart';
import 'package:provider/provider.dart';

class RecordingsController extends ChangeNotifier {

  bool _isRecording = false;
  String _recordingFilePath;

  get isRecording => _isRecording;

  void onMainButtonTap(BuildContext context) {
    _isRecording = !_isRecording;
    if (this._isRecording) {
      this._startRecording();
    } else {
      this._stopRecording(context);
    }
    notifyListeners();
  }


  void _startRecording() async {
    bool hasPermission = await checkRecordingPermission();
    if (hasPermission) {

      final fileName = this.generateFileName();
      _recordingFilePath = await FileSystemUtil.getNewFilePath(fileName);
      RecorderService.start(_recordingFilePath);
    }
  }

  String generateFileName() {
    final now = new DateTime.now();
    return '${now.year}-${now.month}-${now.day}'
        '_'
        '${now.hour}-${now.minute}-${now.second}';
  }

  void _stopRecording(BuildContext context) {
    RecorderService.stop();
    final recordingFilesService = Provider.of<RecordingFilesService>(context, listen: false);
    if (_recordingFilePath != null) {
      recordingFilesService.addRecording(_recordingFilePath);
    }
    _recordingFilePath = null;
  }
}
