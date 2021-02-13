import 'package:demo_recorder/services/audioplayer.service.dart';
import 'package:flutter/material.dart';

class SeekBar extends StatefulWidget {

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _currentSliderValue = 0;
  double _maxDuration = 1000000;

  @override
  void initState() {
    super.initState();
    AudioPlayerService.onPositionChanged(this._onPositionChanged);
    AudioPlayerService.onDurationObtained(this._onDurationObtained);
  }

  void _onPositionChanged(Duration position) {
    final sliderValue = position.inMilliseconds.toDouble();
    _setSliderValue(sliderValue);
  }

  void _onDurationObtained(Duration duration) {
    _maxDuration = duration.inMilliseconds.toDouble();
  }

  void _setSliderValue(double value) {
    setState(() {
      _currentSliderValue = value;
    });
  }

  void _onSeek(double value) {
    final position = Duration(milliseconds: value.toInt());
    AudioPlayerService.seek(position);
  }

  @override
  void dispose() {
    _disposeAudioPlayerSubscriptions();
    super.dispose();
  }

  void _disposeAudioPlayerSubscriptions() {
    AudioPlayerService.disposeOnPositionChanged(this._onPositionChanged);
    AudioPlayerService.disposeOnDurationObtained(this._onDurationObtained);
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: Theme.of(context).sliderTheme,
      child: Slider(
        value: _currentSliderValue,
        min: 0,
        max: _maxDuration,
        divisions: _maxDuration.toInt(),
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          _onSeek(value);
        },
      ),
    );
  }
}
