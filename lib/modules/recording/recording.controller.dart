import 'package:demo_recorder/services/recorder.service.dart';
import 'package:demo_recorder/services/recording_files.service.dart';
import 'package:demo_recorder/util/file_system.util.dart';
import 'package:flutter/material.dart';
import 'package:demo_recorder/util/permissions.util.dart';
import 'package:provider/provider.dart';

class RecordingsController extends ChangeNotifier {
  RecorderService _recorderService;
  RecordingFilesService _recordingFilesService;
  bool _isRecording = false;
  String _recordingFilePath;
  final VoidCallback _showSnackbar;

  bool get isRecording => _isRecording;

  RecordingsController(
      {RecordingFilesService recordingFilesService,
      RecorderService recorderService,
      void Function() showSnackbar})
      : _recordingFilesService = recordingFilesService,
        _recorderService = recorderService,
        _showSnackbar = showSnackbar;

  void toggleRecording() async {
    _isRecording = !_isRecording;
    if (isRecording) {
      final didStartRecording = await _startRecording();
      if (didStartRecording) {
        notifyListeners();
      } else {
        _isRecording = !_isRecording;
      }
    } else {
      _stopRecording();
      notifyListeners();
    }

  }

  Future<bool> _startRecording() async {
    final String fileName = generateFileName();
    _recordingFilePath = await _recorderService.start(fileName, _showSnackbar);
    return _recordingFilePath != null;
  }

  String generateFileName() {
    final now = new DateTime.now();
    return '${now.year}-${now.month}-${now.day}'
        '_'
        '${now.hour}-${now.minute}-${now.second}';
  }

  void _stopRecording() {
    _recorderService.stop();

    if (_recordingFilePath != null) {
      _recordingFilesService.addRecording(_recordingFilePath);
    }
    _recordingFilePath = null;
  }
}
