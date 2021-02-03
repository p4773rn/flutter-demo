import 'dart:io';

import 'package:demo_recorder/entities/recording.entity.dart';
import 'package:demo_recorder/services/audioplayer.service.dart';
import 'package:flutter/material.dart';

class RecordingsListController extends ChangeNotifier {

  Recording _previouslyPlayedRecording;
  bool isCurrentlyPlaying = false;

  RecordingsListController() {
    AudioPlayerService.onComplete(this._onAudioComplete);
  }


  void _onAudioComplete() {
    _previouslyPlayedRecording.togglePlaying();
    isCurrentlyPlaying = false;
    notifyListeners();
  }


  void togglePlay(Recording recording) {
    final path = recording.path;
    if (path != null && File(path).existsSync()) {
      if (recording.isPlaying == false) {
        if (recording == _previouslyPlayedRecording) {
          AudioPlayerService.resume();
        } else {
          AudioPlayerService.play(path);
          if (isCurrentlyPlaying) {
            _previouslyPlayedRecording.togglePlaying();
          }
          _previouslyPlayedRecording = recording;
        }
        isCurrentlyPlaying = true;

      } else {
        AudioPlayerService.pause();
        isCurrentlyPlaying = false;
      }
      recording.togglePlaying();
      notifyListeners();
    }
  }

}
