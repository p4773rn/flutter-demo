import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:demo_recorder/util/permissions.util.dart';
import 'package:record_mp3/record_mp3.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class RecordingsScreen extends StatefulWidget {
  @override
  _RecordingsScreenState createState() => _RecordingsScreenState();
}

class _RecordingsScreenState extends State<RecordingsScreen> {
  IconData _mainIcon = Icons.mic;
  bool _isRecording = false;
  String recordFilePath;
  int id = 0;

  void _onMainButtonTap() {
    _isRecording = !_isRecording;
    if (this._isRecording) {
      this._startRecording();
    } else {
      this._stopRecording();
    }
  }

  Future<String> _getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${id++}.mp3";
  }

  void _startRecording() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      recordFilePath = await _getFilePath();
      RecordMp3.instance.start(recordFilePath, (type) {
        // record fail callback
      });
      setState(() {
        _mainIcon = Icons.stop;
      });
    }
    setState(() {});
  }

  void _stopRecording() {
    RecordMp3.instance.stop();
    setState(() {
      _mainIcon = Icons.mic;
    });
  }

  void _play() {
    if (recordFilePath != null && File(recordFilePath).existsSync()) {
      AudioPlayer audioPlayer = AudioPlayer();
      audioPlayer.play(recordFilePath, isLocal: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MaterialButton(
          onPressed: _onMainButtonTap,
          color: Colors.red[800],
          textColor: Colors.blueGrey[900],
          child: Icon(
            _mainIcon,
            size: 128,
          ),
          padding: EdgeInsets.all(32),
          shape: CircleBorder(),
        ),
        MaterialButton(
          onPressed: _play,
          color: Colors.red[800],
          textColor: Colors.blueGrey[900],
          child: Icon(
            Icons.play_arrow,
            size: 128,
          ),
          padding: EdgeInsets.all(32),
          shape: CircleBorder(),
        ),
      ]
    );
  }

}