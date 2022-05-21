import 'package:intl/intl.dart';

class XUtils {
  static String formatDuration(Duration duration) {
    return duration.toString().substring(2, 7);
  }

  static String formatNumberSong(int number) {
    final String numberSong = '$number ${number > 1 ? 'tracks' : 'track'}';
    return numberSong;
  }

  static String isValidNameCreatePlaylist(String name) {
    String message = "";
    if (name.isEmpty) {
      message = 'Please enter valid name';
    }
    return message;
  }

  static String getNameFolderOfLink(String s) {
    int _pos = s.lastIndexOf('/');
    var _result = s.substring(_pos + 1);

    return _result;
  }

  static String dateTimeFolder() {
    var date = DateTime.now();
    return DateFormat("dd/MM/yyyy").format(date);
  }
}
