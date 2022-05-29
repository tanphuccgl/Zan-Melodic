import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:intl/intl.dart';
import 'package:on_audio_query/on_audio_query.dart';

class XUtils {
  static String formatDuration(Duration duration) {
    return duration.toString().substring(2, 7);
  }

  static String formatNumberSong(int number) {
    final String numberSong = '$number ${number > 1 ? 'tracks' : 'track'}';
    return numberSong;
  }

  static String formatNumberAlbum(int number) {
    final String numberSong = '$number ${number > 1 ? 'albums' : 'album'}';
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

  static File convertMediaToWaveFile(File media) {
    int _pos = media.path.lastIndexOf('.');
    var _result = media.path.substring(0, _pos);
    final waveFile = File('$_result.wave');
    return waveFile;
  }

  static String dateTimeFolder(int millisecondsSinceEpoch) {
    var date =
        DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch * 1000);
    return DateFormat("dd/MM/yyyy").format(date);
  }

  static String fixFontError(String text) {
    var _decode = text;
    try {
      var _encode = latin1.encode(text);
      _decode = utf8.decode(_encode);
    } catch (e) {
      e;
    }
    return _decode;
  }

  static String formatBytes(int bytes, {int decimals = 1}) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  static String getPathFolder(SongModel song) {
    final _dir = song.data.replaceAll(song.displayName, '');

    final _result = _dir.substring(0, _dir.length - 1);
    return _result;
  }
}
