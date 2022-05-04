import 'dart:developer';

import 'package:on_audio_query/on_audio_query.dart';

class BaseAudioQuery {
  OnAudioQuery audioQuery = OnAudioQuery();

  void permissionsRequest() {
    audioQuery.permissionsRequest();
  }

  Future<List<SongModel>> getAudiofromLocal() async {
    List<SongModel> _listAudio = await audioQuery.querySongs();
    return _listAudio;
  }

  Future<bool> scanMedia(String path) async {
    bool result = await audioQuery.scanMedia(path);
    log(result.toString());
    return result;
  }
}
