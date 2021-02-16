import 'package:demo_recorder/modules/recording/recording.controller.dart';
import 'package:demo_recorder/services/recorder.service.dart';
import 'package:demo_recorder/services/recording_files.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recordingFilesService = Provider.of<RecordingFilesService>(context);
    final recorderService = Provider.of<RecorderService>(context);

    ScaffoldFeatureController showSnackbar() =>
        Scaffold.of(context).showSnackBar(const SnackBar(content: Text('Yay! A SnackBar!')));
    return ChangeNotifierProvider(
      create: (context) => RecordingsController(
          recordingFilesService: recordingFilesService,
          recorderService: recorderService,
          showSnackbar: showSnackbar),
      child: Consumer<RecordingsController>(builder: (context, controller, child) {
        return Center(
          child: MaterialButton(
            onPressed: () => controller.toggleRecording(),
            color: Theme.of(context).buttonColor,
            textColor: Theme.of(context).primaryColor,
            child: Icon(
              controller.isRecording ? Icons.stop : Icons.mic,
              size: 128,
            ),
            padding: const EdgeInsets.all(32),
            shape: const CircleBorder(),
          ),
        );
      }),
    );
  }
}
