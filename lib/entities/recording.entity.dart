class Recording {
  final String path;
  final String name;
  bool isPlaying;

  Recording(this.path) : name = path.split('/').last, isPlaying = false;

  togglePlaying() {
    print(this.isPlaying);
    this.isPlaying = !this.isPlaying;
  }
}