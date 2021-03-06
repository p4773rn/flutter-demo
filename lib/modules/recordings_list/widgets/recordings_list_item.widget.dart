import 'package:demo_recorder/entities/recording.entity.dart';
import 'package:demo_recorder/modules/recordings_list/recordings_list.controller.dart';
import 'package:demo_recorder/modules/recordings_list/widgets/seekbar.widget.dart';
import 'package:demo_recorder/services/audioplayer.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecordingsListItem extends StatelessWidget {
  final Recording recording;
  final Color color;

  RecordingsListItem({Key key, this.recording, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<RecordingsListController>(context);
    final audioPlayerService = Provider.of<AudioPlayerService>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      color: color ?? Colors.white,
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 4),
                  child: Text(recording.name ?? 'no-name'),
                ),
                Visibility(
                  child: SeekBar(audioPlayerService: audioPlayerService),
                  visible: recording.isPlaying,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 16, 16, 16),
            child: IconButton(
              icon: Icon(recording.isPlaying == true ? Icons.pause : Icons.play_arrow),
              onPressed: () => controller.togglePlay(recording),
            ),
          ),
        ],
      ),
    );
  }
}
