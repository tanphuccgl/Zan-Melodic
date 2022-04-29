import 'package:on_audio_query/on_audio_query.dart';

class XAudioQuery {
  static late final OnAudioQuery audioQuery;
  static init() {
    audioQuery = OnAudioQuery();
    audioQuery.permissionsRequest();
  }

  static Future<List<SongModel>> getAudiofromLocal() async {
    List<SongModel> _listDetailAudio = await audioQuery.querySongs();

    return _listDetailAudio;
  }

  static Future<List<SongModel>> fetchTracksFromLocal() async {
    final _list = await getAudiofromLocal();
    var value = _list.where((e) => e.isMusic == true).toList();
    return value;
  }
}
