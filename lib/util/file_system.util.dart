import 'dart:io';

import 'package:path_provider/path_provider.dart';

abstract class FileSystemUtil {
  static String _storageDirectory;

  static get storageDirectory async {
    if (_storageDirectory == null) {
      Directory storageDirectory = await getExternalStorageDirectory();
      _storageDirectory = storageDirectory.path + "/record";
    }
    return _storageDirectory;
  }

  static Future<String> getNewFilePath(String fileName) async {
    final d = Directory(await storageDirectory);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }

    return await storageDirectory + "/$fileName.mp3";
  }

  static Future<List<String>> getFilePaths() async {
    var d = Directory(await storageDirectory);
    if (d.existsSync()) {
      return d.listSync(recursive: false, followLinks: false).map((e) => e.path).toList();
    } else {
      return [];
    }
  }
}
