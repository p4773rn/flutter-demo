import 'package:audioplayers/audioplayers.dart';

abstract class AudioPlayerService {
  static final _audioPlayer = AudioPlayer();
  static final List<Function> _onCompleteCallbacks = [];
  static final List<Function> _onPositionChangedCallbacks = [];
  static final List<Function> _onDurationObtainedCallbacks = [];

  static void init() {
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


  static void play(path) {
    _audioPlayer.play(path, isLocal: true);
  }
  static void pause() {
    _audioPlayer.pause();
  }
  static void resume() {
    _audioPlayer.resume();
  }
  static void onComplete(Function callback) {
    _onCompleteCallbacks.add(callback);
  }
  static void disposeOnComplete(Function callback) {
    _onCompleteCallbacks.remove(callback);
  }

  static void onPositionChanged(Function callback) {
    _onPositionChangedCallbacks.add(callback);
  }
  static void disposeOnPositionChanged(Function callback) {
    _onPositionChangedCallbacks.remove(callback);
  }

  static void onDurationObtained(Function callback) {
    _onDurationObtainedCallbacks.add(callback);
  }
  static void disposeOnDurationObtained(Function callback) {
    _onDurationObtainedCallbacks.remove(callback);
  }

  static void seek(Duration position) {
    _audioPlayer.seek(position);
  }
}