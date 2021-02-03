import 'package:audioplayers/audioplayers.dart';

abstract class AudioPlayerService {
  static final _audioPlayer = AudioPlayer();

  static void play(path) {
    _audioPlayer.play(path, isLocal: true);
  }
  static void pause() {
    _audioPlayer.pause();
  }
  static void resume() {
    _audioPlayer.resume();
  }
  static void onComplete(callback) {
    _audioPlayer.onPlayerCompletion.listen((event) {
      callback();
    });
  }
}