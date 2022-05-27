import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static List<String> loadMedia() {
    List<String>? list = _prefs.getStringList(keyJson);

    return list ?? [];
  }

  static void saveMedia(String name) async {
    await _prefs.setStringList(keyJson, [...(loadMedia()), name]);
  }

  static String keyJson = 'j12';
}
