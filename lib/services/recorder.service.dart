
import 'package:record_mp3/record_mp3.dart';

abstract class RecorderService {
  static RecordMp3 _instance = RecordMp3.instance;

  static void start(String recordFilePath) {
    _instance.start(recordFilePath, (type) {
    //  Record start failed
    });
  }

  static void stop() {
    _instance.stop();
  }
}