import 'package:demo_recorder/modules/recording/recording.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RecordingsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecordingsController(),
      child: Consumer<RecordingsController>(
        builder: (context, controller, child) {
          return Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () => controller.onMainButtonTap(context),
                    color: Theme.of(context).buttonColor,
                    textColor: Theme.of(context).primaryColor,
                    child: Icon(
                      controller.isRecording ? Icons.stop : Icons.mic,
                      size: 128,
                    ),
                    padding: EdgeInsets.all(32),
                    shape: CircleBorder(),
                  ),
                ]
              ),
            ),
          );
        }
      )
    );
  }
}
