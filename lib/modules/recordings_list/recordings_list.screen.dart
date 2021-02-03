import 'package:demo_recorder/modules/home/home.controller.dart';
import 'package:demo_recorder/modules/recordings_list/recordings_list.controller.dart';
import 'package:demo_recorder/modules/recordings_list/widgets/recordings_list_item.widget.dart';
import 'package:demo_recorder/services/recording_files.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordingsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecordingsListController(),
      child: Consumer<RecordingFilesService>(
        builder: (context, controller, child) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              final recording = controller.recordings[index];
              return RecordingsListItem(
                recording: recording,
                color: _getListItemColor(context, index),
              );
              // return ListTile(
              //   tileColor: _getListItemColor(context, index),
              //   title: Text(
              //     recording.name ?? 'Corrupted file',
              //   ),
              //   subtitle: Text(
              //     recording.path ?? 'Corrupted file',
              //     maxLines: 1,
              //     overflow: TextOverflow.ellipsis,
              //   ),
              //   onTap: (){},
              // );
            },
            itemCount: controller.recordings.length,
          );
        },
      ),
    );
  }

  Color _getListItemColor(BuildContext context, int index) {
    final evenColor = Theme.of(context).primaryColor.withOpacity(0.2);
    final oddColor = Theme.of(context).primaryColor.withOpacity(0.1);
    return index % 2 == 0 ? evenColor : oddColor;
  }
}
