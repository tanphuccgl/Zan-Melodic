class XUtil {
  static String formatDuration(Duration duration) {
    return duration.toString().substring(2, 7);
  }

  static String formatNumberSong(int number) {
    final String numberSong = '$number ${number > 1 ? 'tracks' : 'track'}';
    return numberSong;
  }
}
