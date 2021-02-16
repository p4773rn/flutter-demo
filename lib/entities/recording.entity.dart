class Recording {
  final String path;
  final String name;
  bool isPlaying;

  Recording(this.path)
      : name = path.split('/').last,
        isPlaying = false;

  void togglePlaying() {
    isPlaying = !isPlaying;
  }
}
