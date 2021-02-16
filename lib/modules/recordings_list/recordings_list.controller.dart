import 'dart:io';

import 'package:demo_recorder/entities/recording.entity.dart';
import 'package:demo_recorder/services/audioplayer.service.dart';
import 'package:demo_recorder/services/recording_files.service.dart';
import 'package:flutter/material.dart';

class RecordingsListController extends ChangeNotifier {
  final RecordingFilesService _recordingFilesService;
  final AudioPlayerService _audioPlayerService;
  Recording _currentlyPlayingRecording;

  List<Recording> get recordings => _recordingFilesService.recordings;

  RecordingsListController({recordingFilesService, audioPlayerService})
      : _recordingFilesService = recordingFilesService,
        _audioPlayerService = audioPlayerService {
    _audioPlayerService.addOnCompleteCallback(this._onAudioComplete);
  }

  void _onAudioComplete() {
    _currentlyPlayingRecording.togglePlaying();
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayerService.removeOnCompleteCallback(this._onAudioComplete);
    super.dispose();
  }

  void togglePlay(Recording recording) {
    final path = recording.path;
    if (path != null && File(path).existsSync()) {
      if (recording.isPlaying == false) {
        if (recording == _currentlyPlayingRecording) {
          _audioPlayerService.resume();
        } else {
          if (_currentlyPlayingRecording != null && _currentlyPlayingRecording.isPlaying) {
            _currentlyPlayingRecording.togglePlaying();
          }
          _audioPlayerService.play(path);
          _currentlyPlayingRecording = recording;
        }
      } else {
        _audioPlayerService.pause();
      }
      recording.togglePlaying();
      notifyListeners();
    }
  }
}
