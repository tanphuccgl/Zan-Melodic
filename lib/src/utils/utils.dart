import 'dart:math';

import 'package:intl/intl.dart';

class Utils {
  static String getNameFolderOfLink(String s) {
    var pos = s.lastIndexOf('/');
    String result = (pos != -1) ? s.substring(pos + 1, s.length) : s;
    return result;
  }

  static String dateTimeFolder() {
    var date = DateTime.now();
    return DateFormat("dd/MM/yyyy").format(date);
  }

  static String idRandom() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  static int colorRandom() {
    return (Random().nextDouble() * 0xFFFFFF).toInt();
  }

  static String formatSize(double bytes) {
    if (bytes == 0) return '0 Bytes';
    const decimals = 2;
    const k = 1024;
    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (log(bytes) / log(k)).floor();
    return ((bytes / pow(k, i)).toStringAsFixed(decimals)) + ' ' + sizes[i];
  }
}
