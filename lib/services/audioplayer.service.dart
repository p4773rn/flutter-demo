import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

/// Service to play audio giving it audio path
class AudioPlayerService {
  final _audioPlayer = AudioPlayer();
  final List<VoidCallback> _onCompleteCallbacks = [];
  final List<void Function(Duration)> _onPositionChangedCallbacks = [];
  final List<void Function(Duration)> _onDurationObtainedCallbacks = [];

  AudioPlayerService() {
    _audioPlayer.onPlayerCompletion.listen((event) {
      _onCompleteCallbacks.forEach((cb) {
        cb();
      });
    });

    _audioPlayer.onAudioPositionChanged.listen((Duration position) => {
          _onPositionChangedCallbacks.forEach((cb) {
            cb(position);
          })
        });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      _onDurationObtainedCallbacks.forEach((cb) {
        cb(duration);
      });
    });
  }

  /// Play specified audio
  /// [path] - path to audio, must be local
  void play(String path) {
    _audioPlayer.play(path, isLocal: true);
  }

  /// Pause currently playing audio
  void pause() {
    _audioPlayer.pause();
  }

  /// Resume previously paused audio
  void resume() {
    _audioPlayer.resume();
  }

  /// Subscribe to event of audio finished (not paused or stopped)
  void addOnCompleteCallback(Function callback) {
    _onCompleteCallbacks.add(callback);
  }

  /// Unsubscribe to event of audio finished (not paused or stopped)
  void removeOnCompleteCallback(Function callback) {
    _onCompleteCallbacks.remove(callback);
  }

  /// Subscribe to event of audio position changed while playing (every ~201 ms)
  void addOnPositionChangedCallback(Function callback) {
    _onPositionChangedCallbacks.add(callback);
  }

  /// Unsubscribe to event of audio position changed while playing (every ~201 ms)
  void removeOnPositionChangedCallback(Function callback) {
    _onPositionChangedCallbacks.remove(callback);
  }

  /// Subscribe to event of audio total duration obtaining
  void addOnDurationObtainedCallback(Function callback) {
    _onDurationObtainedCallbacks.add(callback);
  }

  /// Unsubscribe to event of audio total duration obtaining
  void removeOnDurationObtainedCallback(Function callback) {
    _onDurationObtainedCallbacks.remove(callback);
  }

  /// Seek the provided position of currently playing audio
  void seek(Duration position) {
    _audioPlayer.seek(position);
  }
}
