import 'package:demo_recorder/entities/recording.entity.dart';
import 'package:demo_recorder/modules/recordings_list/recordings_list.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordingsListItem extends StatelessWidget {
  final Recording recording;
  final Color color;

  RecordingsListItem({Key key, this.recording, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecordingsListController>(
      builder: (context, controller, child) {
        return Container(
          padding: const EdgeInsets.all(16),
          color: color ?? Colors.white,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(recording.name ?? 'no-name'),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(recording.isPlaying == true ? Icons.pause : Icons.play_arrow),
                  onPressed: () => controller.togglePlay(recording),
                ),
              ),
            ],
          ),
        );
      }
    );
  }

}
