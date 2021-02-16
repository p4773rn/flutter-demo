import 'package:demo_recorder/services/audioplayer.service.dart';
import 'package:flutter/material.dart';

class SeekBar extends StatefulWidget {

  final AudioPlayerService _audioPlayerService;

  SeekBar({audioPlayerService}) : _audioPlayerService = audioPlayerService;

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _currentSliderValue = 0;
  double _maxDuration = 1000000;

  @override
  void initState() {
    super.initState();
    widget._audioPlayerService.addOnPositionChangedCallback(this._onPositionChanged);
    widget._audioPlayerService.addOnDurationObtainedCallback(this._onDurationObtained);
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
    widget._audioPlayerService.seek(position);
  }

  @override
  void dispose() {
    _disposeAudioPlayerSubscriptions();
    super.dispose();
  }

  void _disposeAudioPlayerSubscriptions() {
    widget._audioPlayerService.removeOnPositionChangedCallback(this._onPositionChanged);
    widget._audioPlayerService.removeOnDurationObtainedCallback(this._onDurationObtained);
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
