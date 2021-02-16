import 'package:demo_recorder/modules/recordings_list/recordings_list.controller.dart';
import 'package:demo_recorder/modules/recordings_list/widgets/recordings_list_item.widget.dart';
import 'package:demo_recorder/services/audioplayer.service.dart';
import 'package:demo_recorder/services/recording_files.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordingsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recordingFilesService = Provider.of<RecordingFilesService>(context);
    final audioPlayerService = Provider.of<AudioPlayerService>(context);
    return ChangeNotifierProvider(
      create: (context) => RecordingsListController(
          recordingFilesService: recordingFilesService, audioPlayerService: audioPlayerService),
      child: Consumer<RecordingsListController>(
        builder: (context, controller, child) {
          return controller.recordings.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    final recording = controller.recordings[index];
                    return RecordingsListItem(
                      recording: recording,
                      color: _getListItemColor(context, index),
                    );
                  },
                  itemCount: controller.recordings.length,
                )
              : Center(
                  child: Text('No recordings yet'),
                );
        },
      ),
    );
  }

  Color _getListItemColor(BuildContext context, int index) {
    final evenColor = Theme.of(context).primaryColor.withOpacity(0.15);
    final oddColor = Theme.of(context).primaryColor.withOpacity(0.1);
    return index.isEven ? evenColor : oddColor;
  }
}
