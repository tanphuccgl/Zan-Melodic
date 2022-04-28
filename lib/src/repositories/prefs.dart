import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:zanmelodic/src/models/folder_model.dart';

class Prefs {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void saveListFolderToLocal(List<XFolder> listFolder) {
    String jsonListFolder = jsonEncode(listFolder);
    _prefs.setString('listFolder', jsonListFolder);
  }

  static List<XFolder> getListFolderToLocal() {
    final String? temp = _prefs.getString('listFolder');
    if (temp != null) {
      List<XFolder> list =
          (json.decode(temp) as List).map((i) => XFolder.fromJson(i)).toList();

      return list.cast<XFolder>();
    }
    return [];
  }
}
