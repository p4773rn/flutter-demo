import 'dart:io';

import 'package:path_provider/path_provider.dart';

abstract class FileSystemUtil {
  static String _recordingsDirectory;

  static Future<String> get storageDirectory async {
    if (_recordingsDirectory == null) {
      Directory storageDirectory = await getExternalStorageDirectory();
      _recordingsDirectory = storageDirectory.path + "/record";
    }
    return _recordingsDirectory;
  }

  static Future<String> getNewRecordingPath(String fileName) async {
    final d = Directory(await storageDirectory);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }

    return await storageDirectory + "/$fileName.mp3";
  }

  static Future<List<String>> getRecordingPaths() async {
    var d = Directory(await storageDirectory);
    if (d.existsSync()) {
      return d.listSync(recursive: false, followLinks: false).map((e) => e.path).toList();
    } else {
      return [];
    }
  }
}
